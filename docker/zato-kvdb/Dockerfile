FROM redis
# COPY --from=talexie/zatobase:latest /opt/zato/env/build_secrets /tmp/build_secrets

# Copy our build files
COPY ./secrets/env_file /tmp/build_secrets
COPY ./docker/scripts/build-zato-kvdb.sh /tmp/build-zato-kvdb.sh

RUN grep ZATO_KVDB_PASS /tmp/build_secrets > /etc/redis-secret

# Build our Zato REDIS component
RUN bash /tmp/build-zato-kvdb.sh build-zato-kvdb
CMD bash /tmp/build-zato-kvdb.sh run-base-warning

# Clean up the secrets
RUN rm /tmp/build_secrets

ENTRYPOINT bash -c 'source /etc/redis-secret && redis-server --requirepass $ZATO_KVDB_PASS'
