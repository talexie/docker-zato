FROM talexie/zatobase:latest

# Install PostgreSQL
USER root
RUN apt-get install -y postgresql-10 postgresql-contrib

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/10/main/pg_hba.conf && \
    echo "listen_addresses='*'" >> /etc/postgresql/10/main/postgresql.conf
RUN sed -i 's/max_connections = 10/max_connections = 100/' /etc/postgresql/10/main/postgresql.conf

# Copy our build files
COPY ./secrets/env_file /opt/zato/env/build_secrets
COPY ./docker/zato-component/build-zato-image.sh /opt/zato/env/build-zato-image.sh
RUN chown -R zato:zato /opt/zato/env

# Build our Zato ODB components
RUN bash /opt/zato/env/build-zato-image.sh build-zato-odb-cluster
CMD bash /opt/zato/env/build-zato-image.sh run-base-warning

ENTRYPOINT sudo -u postgres \
    /usr/lib/postgresql/10/bin/postgres \
    -D /var/lib/postgresql/10/main \
    -c config_file=/etc/postgresql/10/main/postgresql.conf
