# grpc4bmi server for `HeatC` model from bmi-example-c.
FROM csdms/grpc4bmi

LABEL maintainer="Mark Piper <mark.piper@colorado.edu>"

RUN git clone --branch v2.0.3 --depth 1 https://github.com/csdms/bmi-example-c /opt/bmi-example-c
WORKDIR /opt/bmi-example-c/_build
RUN cmake .. && \
    make && \
    make test && \
    make install && \
    make clean

WORKDIR /opt
