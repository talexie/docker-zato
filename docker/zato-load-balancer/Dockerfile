FROM talexie/zatobase:latest

# Copy certificates

COPY ./secrets/certs/zato.load_balancer.key.pub.pem /opt/zato/env/load-balancer/zato.load_balancer.key.pub.pem
COPY ./secrets/certs/zato.load_balancer.key.pem /opt/zato/env/load-balancer/zato.load_balancer.key.pem
COPY ./secrets/certs/zato.load_balancer.cert.pem /opt/zato/env/load-balancer/zato.load_balancer.cert.pem

RUN mkdir -p /opt/zato/configs

COPY --chown=zato:zato ./docker/zato-load-balancer/supervisord.conf /opt/zato/configs/


# Copy our build files

COPY ./secrets/env_file /opt/zato/env/build_secrets
COPY ./docker/zato-component/build-zato-image.sh /opt/zato/env/build-zato-image.sh
RUN chown -R zato:zato /opt/zato/env

# Build our Zato Load balancer components
RUN bash /opt/zato/env/build-zato-image.sh build-zato-load-balancer
CMD bash /opt/zato/env/build-zato-image.sh run-base-warning

COPY --chown=zato:zato ./docker/zato-load-balancer/zato_start_load_balancer /opt/zato/
COPY --chown=zato:zato ./docker/zato-load-balancer/supervisord.conf /opt/zato/
RUN chmod 755 /opt/zato/zato_start_load_balancer

USER root

EXPOSE 11223 20151

CMD /usr/bin/supervisord -c /opt/zato/supervisord.conf
