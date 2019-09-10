FROM ubuntu:18.04 AS build

RUN apt-get update && \
	apt-get install -y build-essential git cmake autoconf libtool pkg-config

WORKDIR /src

COPY CMakeLists.txt main.cpp ./

RUN cmake .
RUN make

FROM ubuntu:18.04

WORKDIR /opt/ola-mundo

COPY --from=build /src/olamundo ./

CMD ["./olamundo"]
