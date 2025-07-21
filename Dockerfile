# grpc4bmi server for the `HeatC` model from bmi-example-c.
FROM mdpiper/grpc4bmi-154

LABEL maintainer="Mark Piper <mark.piper@colorado.edu>"

RUN git clone --branch v2.0.3 --depth 1 https://github.com/csdms/bmi-example-c /opt/bmi-example-c
WORKDIR /opt/bmi-example-c/_build
RUN cmake .. && \
    make && \
    make test && \
    make install && \
    make clean

# Build the grpc4bmi server for the `heatc` model.
COPY server /opt/heatc-grpc4bmi-server
WORKDIR /opt/heatc-grpc4bmi-server/_build
RUN cmake .. && \
    make && \
    make install && \
    make clean

WORKDIR /opt

ENTRYPOINT ["/usr/local/bin/heatc-grpc4bmi-server"]
EXPOSE 55555
