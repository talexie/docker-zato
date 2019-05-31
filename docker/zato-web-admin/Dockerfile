FROM talexie/zatobase:latest
ARG ZATO_ODB_HOST=zato-odb
ARG ZATO_KVDB_HOST=zato-kvdb

# Copy certificates

COPY ./secrets/certs/zato.web_admin.key.pub.pem /opt/zato/env/web-admin/zato.web_admin.key.pub.pem
COPY ./secrets/certs/zato.web_admin.key.pem /opt/zato/env/web-admin/zato.web_admin.key.pem
COPY ./secrets/certs/zato.web_admin.cert.pem /opt/zato/env/web-admin/zato.web_admin.cert.pem

RUN mkdir -p /opt/zato/configs

COPY --chown=zato:zato ./docker/zato-web-admin/supervisord.conf /opt/zato/configs/

# Copy our build files

COPY ./secrets/env_file /opt/zato/env/build_secrets

COPY ./docker/zato-component/build-zato-image.sh /opt/zato/env/build-zato-image.sh
RUN chown -R zato:zato /opt/zato/env

# RUN sed -i -r "s/zato-odb/${ZATO_ODB_HOST}/g" /opt/zato/env/build_secrets
# RUN sed -i -r "s/zato-kvdb/${ZATO_KVDB_HOST}/g" /opt/zato/env/build_secrets


# Build our Zato Web admin and scheduler components
RUN bash /opt/zato/env/build-zato-image.sh build-zato-web-admin
CMD bash /opt/zato/env/build-zato-image.sh run-base-warning


COPY --chown=zato:zato ./docker/zato-web-admin/zato_start_web_admin /opt/zato/
COPY --chown=zato:zato ./docker/zato-web-admin/supervisord.conf /opt/zato/
RUN chmod 755 /opt/zato/zato_start_web_admin


USER root
EXPOSE 8183

CMD /usr/bin/supervisord -c /opt/zato/supervisord.conf
