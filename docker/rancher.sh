#!/usr/bin/env bash

set -e
#set -x Use this for debugging

export ZATO_SERVER_COUNT=${ZATO_SERVER_COUNT:-10}
export PROJECT_DIR="$( cd "$(dirname "$0")" ; cd .. ; pwd -P )"
export PROJECT_NAME="${PROJECT_NAME:-"zatodev"}"
export CONTEXT_DIR="${PROJECT_DIR}"
export SECRET_DIR="${CONTEXT_DIR}/secrets"

cd "$CONTEXT_DIR" || exit 1
echo "Project directory: ${PROJECT_DIR}"
echo "Docker context directory: ${CONTEXT_DIR}"

# Generate our self-signed SSL certificates
SSL_SUBJECT="/C=AU/ST=Zatoland/L=Zato City/O=Zato"
OPENSSL_CONIG="${PROJECT_DIR}/docker/openssl-with-ca.cnf"
if [ ! -e "${SECRET_DIR}/certs/ssl_okay" ]; then
    echo "Generating Zato self-signed certificates..."
    mkdir -p "${SECRET_DIR}/certs"
    cd "${SECRET_DIR}/certs"
	ssl_log="openssl-commands.txt"

    openssl genrsa -out zato.ca.key.pem 2048
    openssl req -new -x509 -days 3650 -extensions v3_ca -config "$OPENSSL_CONIG" \
        	-subj "${SSL_SUBJECT}/CN=Zato Dev CA" -key zato.ca.key.pem -out ./zato.ca.cert.pem

    openssl genrsa -out zato.load_balancer.key.pem 2048
    openssl rsa -in zato.load_balancer.key.pem -pubout -out zato.load_balancer.key.pub.pem
    openssl req -new -key zato.load_balancer.key.pem -out zato.load_balancer.req.csr \
			-subj "${SSL_SUBJECT}/CN=Zato Dev Load Balancer"
    openssl x509 -req -days 365 -in zato.load_balancer.req.csr -CA ./zato.ca.cert.pem \
			-CAkey zato.ca.key.pem -CAcreateserial -out zato.load_balancer.cert.pem

    rm -f zato.load_balancer.req.csr

    openssl genrsa -out zato.web_admin.key.pem 2048
    openssl rsa -in zato.web_admin.key.pem -pubout -out zato.web_admin.key.pub.pem
    openssl req -new -key zato.web_admin.key.pem -out zato.web_admin.req.csr \
			-subj "${SSL_SUBJECT}/CN=Zato Dev Web Admin"
    openssl x509 -req -days 365 -in zato.web_admin.req.csr -CA ./zato.ca.cert.pem \
			-CAkey zato.ca.key.pem -CAcreateserial -out zato.web_admin.cert.pem
    rm -f zato.web_admin.req.csr

    openssl genrsa -out zato.scheduler.key.pem 2048
    openssl rsa -in zato.scheduler.key.pem -pubout -out zato.scheduler.key.pub.pem
    openssl req -new -key zato.scheduler.key.pem -out zato.scheduler.req.csr \
			-subj "${SSL_SUBJECT}/CN=Zato Dev Scheduler"
    openssl x509 -req -days 365 -in zato.scheduler.req.csr -CA ./zato.ca.cert.pem \
			-CAkey zato.ca.key.pem -CAcreateserial -out zato.scheduler.cert.pem
    rm -f zato.scheduler.req.csr

    i=1
    while [ $i -le $ZATO_SERVER_COUNT ]
    do
	no=$(printf "%02d\n" $i)
        openssl genrsa -out zato.server${no}.key.pem 2048
        openssl rsa -in zato.server${no}.key.pem -pubout -out zato.server${no}.key.pub.pem
        openssl req -new -key zato.server${no}.key.pem -out zato.server${no}.req.csr \
                -subj "${SSL_SUBJECT}/CN=Zato Dev Server ${no}"
        openssl x509 -req -days 365 -in zato.server${no}.req.csr -CA ./zato.ca.cert.pem \
                -CAkey zato.ca.key.pem -CAcreateserial -out zato.server${no}.cert.pem
        rm -f zato.server${no}.req.csr
        i=$[i+1]
    done

	echo 1 > "${SECRET_DIR}/certs/ssl_okay"
fi

if [ ! -e "${SECRET_DIR}/env_file" ]; then
    echo "Creating environment file..."

    function add_env() {
        name="$1"
        use_val="$2"
        [[ "$use_val" == "UUID_GEN" ]] && use_val="$(uuidgen)"
        [[ "$use_val" == "FERNET_GEN" ]] && \
            use_val="$(python -c 'from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())')"

        echo "export ${name}=\"${use_val}\"" >> "${SECRET_DIR}/env_file"
    }

    add_env ZATO_BIN "/opt/zato/current/bin/zato"
    add_env POSTGRES_PASSWORD ${POSTGRES_PASSWORD:-"UUID_GEN"}
    #add_env ZATO_POSTGRES_HOST zato_odb  # If you change this, you must also change docker-compose.yml
    add_env ZATO_POSTGRES_HOST ${ZATO_POSTGRES_HOST:-"zato-odb"}
    add_env ZATO_POSTGRES_PORT ${ZATO_POSTGRES_PORT:-"5432"}
    add_env ZATO_POSTGRES_USER ${ZATO_POSTGRES_USER:-"zato"}
    add_env ZATO_POSTGRES_PASS ${ZATO_POSTGRES_PASS:-"UUID_GEN"}
    add_env ZATO_POSTGRES_NAME ${ZATO_POSTGRES_NAME:-"zato"}
    add_env ZATO_POSTGRES_SCHEMA ${ZATO_POSTGRES_SCHEMA:-"zato"}
    add_env ZATO_ADMIN_PASSWORD ${ZATO_ADMIN_PASSWORD:-"UUID_GEN"}
    add_env ZATO_TECH_USERNAME ${ZATO_TECH_USERNAME:-"zatoacct"}
    add_env ZATO_TECH_PASSWORD ${ZATO_TECH_PASSWORD:-"UUID_GEN"}
    add_env ZATO_KVDB_HOST ${ZATO_KVDB_HOST:-"zato-kvdb"}     # If you change this, you must also change docker-compose.yml
    add_env ZATO_KVDB_PASS ${ZATO_KVDB_PASS:-"UUID_GEN"}
    add_env ZATO_KVDB_PORT ${ZATO_KVDB_PORT:-"6379"}
    add_env ZATO_CLUSTER_NAME ${ZATO_CLUSTER_NAME:-"cluster1"}
    add_env ZATO_LB_HOST ${ZATO_LB_HOST:-"zato-lb"}
    add_env ZATO_LB_PORT ${ZATO_LB_PORT:-"11223"}
    add_env ZATO_LB_AGENT_PORT ${ZATO_LB_AGENT_PORT:-"20151"}
    add_env ZATO_CLUSTER_NAME ${ZATO_CLUSTER_NAME:-"cluster1"}
    add_env ZATO_JWT_SECRET ${ZATO_JWT_SECRET:-"FERNET_GEN"}
    add_env ZATO_SECRET_KEY ${ZATO_SECRET_KEY:-"FERNET_GEN"}
    #add_env ZATO_NETWORK_START ${ZATO_NETWORK_START:-"10.9.8."}
fi

if [[ "$(docker image ls -q talexie/zatobase:latest)" != "" ]]; then
    cd "${PROJECT_DIR}"
    echo "Building talexie/zatobase:latest"
    docker build --file docker/Dockerfile . --tag talexie/zatobase:latest
fi
if [[ "$(docker image ls -q talexie/zato-odb:latest)" != "" ]]; then
    cd "${PROJECT_DIR}"
    echo "Building talexie/zato-odb:latest"
    docker build --add-host=zato-odb:127.0.0.1 --file docker/zato-odb/Dockerfile . --tag talexie/zato-odb:latest
fi
#if [[ "$(docker image ls -q talexie/zato-kvdb:latest)" == "" ]]; then
    cd "${PROJECT_DIR}"
    echo "Building talexie/zato-kvdb:latest"
    docker build --add-host=zato-kvdb:127.0.0.1 --file docker/zato-kvdb/Dockerfile . --tag talexie/zato-kvdb:latest
#fi
# Start ODB cluster so that web admin can use it.
if [[ "$(docker container ls -q -f name='zato-odb')" == "" ]]; then
  docker run -d --name=zato-odb talexie/zato-odb:latest
else
  docker stop zato-odb
  docker rm zato-odb
  docker run -d --name=zato-odb talexie/zato-odb:latest
fi
if [[ "$(docker container ls -q -f name='zato-kvdb')" == "" ]]; then
  docker run -d --name=zato-kvdb talexie/zato-kvdb:latest
else
  docker stop zato-kvdb
  docker rm zato-kvdb
  docker run -d --name=zato-kvdb talexie/zato-kvdb:latest
fi
 sleep 20
 #if [[ "$(docker image ls -q talexie/zato-load-balancer:latest)" != "" ]]; then
     cd "${PROJECT_DIR}"
     echo "Building talexie/zato-load-balancer:latest"
     docker build --file docker/zato-load-balancer/Dockerfile . --tag talexie/zato-load-balancer:latest
 #fi
 #if [[ "$(docker image ls -q talexie/zato-web-admin:latest)" != "" ]]; then

     cd "${PROJECT_DIR}"
     echo "Building talexie/zato-scheduler:latest"

     docker build \
     --build-arg ZATO_ODB_HOST="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-odb)" \
     --build-arg ZATO_KVDB_HOST="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-kvdb)" \
     --add-host zato-odb:"$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-odb)" \
     --add-host zato-kdb:"$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-kvdb)" \
     --file docker/zato-scheduler/Dockerfile . --tag talexie/zato-scheduler:latest
 #fi
#if [[ "$(docker image ls -q talexie/zato-server:latest)" != "" ]]; then
    cd "${PROJECT_DIR}"
    echo "Building talexie/zato-server:latest"
    docker build \
    --build-arg ZATO_ODB_HOST="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-odb)" \
    --build-arg ZATO_KVDB_HOST="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-kvdb)" \
    --add-host zato-odb:"$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-odb)" \
    --add-host zato-kdb:"$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-kvdb)" \
    --file docker/zato-server/Dockerfile . --tag talexie/zato-server:latest
#fi

#if [[ "$(docker image ls -q talexie/zato-web-admin:latest)" != "" ]]; then

    cd "${PROJECT_DIR}"
    echo "Building talexie/zato-web-admin:latest"

    docker build \
    --build-arg ZATO_ODB_HOST="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-odb)" \
    --build-arg ZATO_KVDB_HOST="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-kvdb)" \
    --add-host zato-odb:"$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-odb)" \
    --add-host zato-kdb:"$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zato-kvdb)" \
    --file docker/zato-web-admin/Dockerfile . --tag talexie/zato-web-admin:latest
#fi

# Stop and remove the containers
if [[ "$(docker container ls -q -f name=zato-odb)" != "" ]]; then
  echo "Cleaning up"
  docker commit -m "Applied cluster details" zato-odb talexie/zato-odb:latest
  docker stop zato-odb
  docker rm zato-odb
fi
if [[ "$(docker container ls -q -f name=zato-kvdb)" != "" ]]; then
  docker commit -m "Applied cluster details" zato-kvdb talexie/zato-kvdb:latest
  docker stop zato-kvdb
  docker rm zato-kvdb
fi

if [[ "$@" == "" ]]; then

    docker-compose --help
    #echo ""
    #echo "Commands (from compose.sh)"
    #echo "  clearenv           Clear the environment file"
    #echo "  clearcerts         Clear the certificates generated"
    #echo "  clearimg           Remove the zatobase:latest image"
    #echo "  clearboth          Clear both"
    echo ""
    echo "Note that compose.sh will automatically supply the following to docker-compose:"
    echo "  --file '${CONTEXT_DIR}/docker/docker-compose.yml'"
    echo "  --project-directory '${CONTEXT_DIR}'"
    echo "  --project-name '${PROJECT_NAME}'"
    echo ""
else
    cd "$CONTEXT_DIR" || exit 1
    exec "migration-tools parse --docker-file '${CONTEXT_DIR}/docker/docker-compose-no-net.yml'" \
        "$@"
fi
set +x
