FROM talexie/zatobase:latest
ARG ZATO_ODB_HOST=zato-odb
ARG ZATO_KVDB_HOST=zato-kvdb

# Copy certificates

COPY ./secrets/certs/zato.scheduler.key.pub.pem /opt/zato/env/scheduler/zato.scheduler.key.pub.pem
COPY ./secrets/certs/zato.scheduler.key.pem /opt/zato/env/scheduler/zato.scheduler.key.pem
COPY ./secrets/certs/zato.scheduler.cert.pem /opt/zato/env/scheduler/zato.scheduler.cert.pem

RUN mkdir -p /opt/zato/configs

COPY --chown=zato:zato ./docker/zato-scheduler/supervisord.conf /opt/zato/configs/

# Copy our build files

COPY ./secrets/env_file /opt/zato/env/build_secrets

COPY ./docker/zato-component/build-zato-image.sh /opt/zato/env/build-zato-image.sh
RUN chown -R zato:zato /opt/zato/env

# Build our Zato scheduler components
RUN bash /opt/zato/env/build-zato-image.sh build-zato-scheduler
CMD bash /opt/zato/env/build-zato-image.sh run-base-warning

COPY --chown=zato:zato ./docker/zato-scheduler/zato_start_scheduler /opt/zato/
COPY --chown=zato:zato ./docker/zato-scheduler/supervisord.conf /opt/zato/
RUN chmod 755 /opt/zato/zato_start_scheduler


USER root
EXPOSE 31530

CMD /usr/bin/supervisord -c /opt/zato/supervisord.conf
