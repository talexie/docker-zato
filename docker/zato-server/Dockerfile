FROM talexie/zatobase:latest
ARG ZATO_ODB_HOST=zato-odb
ARG ZATO_KVDB_HOST=zato-kvdb

# Copy certificates

COPY ./secrets/certs/zato.ca.cert.pem /opt/zato/env/zato.ca.cert.pem
COPY ./secrets/certs/zato.server01.key.pub.pem /opt/zato/env/server01/zato.server01.key.pub.pem
COPY ./secrets/certs/zato.server01.key.pem /opt/zato/env/server01/zato.server01.key.pem
COPY ./secrets/certs/zato.server01.cert.pem /opt/zato/env/server01/zato.server01.cert.pem
COPY ./secrets/certs/zato.server02.key.pub.pem /opt/zato/env/server02/zato.server02.key.pub.pem
COPY ./secrets/certs/zato.server02.key.pem /opt/zato/env/server02/zato.server02.key.pem
COPY ./secrets/certs/zato.server02.cert.pem /opt/zato/env/server02/zato.server02.cert.pem
COPY ./secrets/certs/zato.server03.key.pub.pem /opt/zato/env/server03/zato.server03.key.pub.pem
COPY ./secrets/certs/zato.server03.key.pem /opt/zato/env/server03/zato.server03.key.pem
COPY ./secrets/certs/zato.server03.cert.pem /opt/zato/env/server03/zato.server03.cert.pem
COPY ./secrets/certs/zato.server04.key.pub.pem /opt/zato/env/server04/zato.server04.key.pub.pem
COPY ./secrets/certs/zato.server04.key.pem /opt/zato/env/server04/zato.server04.key.pem
COPY ./secrets/certs/zato.server04.cert.pem /opt/zato/env/server04/zato.server04.cert.pem
COPY ./secrets/certs/zato.server05.key.pub.pem /opt/zato/env/server05/zato.server05.key.pub.pem
COPY ./secrets/certs/zato.server05.key.pem /opt/zato/env/server05/zato.server05.key.pem
COPY ./secrets/certs/zato.server05.cert.pem /opt/zato/env/server05/zato.server05.cert.pem
COPY ./secrets/certs/zato.server06.key.pub.pem /opt/zato/env/server06/zato.server06.key.pub.pem
COPY ./secrets/certs/zato.server06.key.pem /opt/zato/env/server06/zato.server06.key.pem
COPY ./secrets/certs/zato.server06.cert.pem /opt/zato/env/server06/zato.server06.cert.pem
COPY ./secrets/certs/zato.server07.key.pub.pem /opt/zato/env/server07/zato.server07.key.pub.pem
COPY ./secrets/certs/zato.server07.key.pem /opt/zato/env/server07/zato.server07.key.pem
COPY ./secrets/certs/zato.server07.cert.pem /opt/zato/env/server07/zato.server07.cert.pem
COPY ./secrets/certs/zato.server08.key.pub.pem /opt/zato/env/server08/zato.server08.key.pub.pem
COPY ./secrets/certs/zato.server08.key.pem /opt/zato/env/server08/zato.server08.key.pem
COPY ./secrets/certs/zato.server08.cert.pem /opt/zato/env/server08/zato.server08.cert.pem

RUN mkdir -p /opt/zato/configs

COPY --chown=zato:zato ./docker/zato-server/supervisord.conf /opt/zato/configs/

# Copy our build files

COPY ./secrets/env_file /opt/zato/env/build_secrets

COPY ./docker/zato-component/build-zato-image.sh /opt/zato/env/build-zato-image.sh
RUN chown -R zato:zato /opt/zato/env

# Build our Zato Server components
RUN bash /opt/zato/env/build-zato-image.sh build-zato-server
CMD bash /opt/zato/env/build-zato-image.sh run-base-warning

COPY --chown=zato:zato ./docker/zato-server/zato_start_server /opt/zato/
COPY --chown=zato:zato ./docker/zato-server/supervisord.conf /opt/zato/
RUN chmod 755 /opt/zato/zato_start_server

EXPOSE 17010
CMD /usr/bin/supervisord -c /opt/zato/supervisord.conf
