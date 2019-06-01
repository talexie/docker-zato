FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y \
    apt-transport-https curl git libcurl4-openssl-dev \
    software-properties-common
RUN apt-get install -y \
    sudo supervisor tzdata

# Install Zato and download the latest version
RUN curl -s https://zato.io/repo/zato-0CBD7F72.pgp.asc | sudo apt-key add - && \
    apt-add-repository https://zato.io/repo/stable/3.0/ubuntu && apt-get update && apt-get install -y zato
WORKDIR /opt/zato/current
USER zato
RUN git pull && ./bin/pip install -e ./zato-cy

# Install PostgreSQL
USER root

# Copy our certificates over
COPY ./secrets/certs/zato.ca.cert.pem /opt/zato/env/zato.ca.cert.pem

# Copy our build files
COPY ./secrets/env_file /opt/zato/env/build_secrets
COPY ./docker/zato-component/build-zato-image.sh /opt/zato/env/build-zato-image.sh
RUN chown -R zato:zato /opt/zato/env

# Build our Zato components
# RUN bash /opt/zato/env/build-zato-image.sh build-zato-components
# CMD bash /opt/zato/env/build-zato-image.sh run-base-warning
