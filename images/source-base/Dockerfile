# A grpc4bmi server for the bmi-example-c `Heat` model.
FROM mdpiper/grpc4bmi

LABEL maintainer="Mark Piper <mark.piper@colorado.edu>"

RUN git clone --branch v2.0.3 --depth 1 https://github.com/csdms/bmi-example-c /opt/bmi-example-c
WORKDIR /opt/bmi-example-c/_build
RUN cmake .. && \
    make && \
    ctest -V && \
    make install && \
    make clean

COPY server /opt/heatc-grpc4bmi-server
WORKDIR /opt/heatc-grpc4bmi-server/_build
RUN cmake .. && \
    make && \
    make install && \
    make clean

RUN ldconfig

WORKDIR /opt

ENTRYPOINT ["/usr/local/bin/heatc-grpc4bmi-server"]
EXPOSE 55555
