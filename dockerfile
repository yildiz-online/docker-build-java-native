FROM moussavdb/build-java

LABEL maintainer="Grégory Van den Borre vandenborre.gregory@hotmail.fr"

RUN apt-get install -y -q make gcc g++ libc-dev pkg-config cmake-data dpkg-dev mingw-w64 cmake unzip python3 libxaw7-dev libgl1-mesa-dev wget autoconf \
&& wget http://sonarcloud.io/static/cpp/build-wrapper-linux-x86.zip \
&& unzip build-wrapper-linux-x86.zip -d /home \
&& cp /home/build-wrapper-linux-x86/* /usr/local/bin \
&& rm -R /home/build-wrapper-linux-x86 \
&& apt-get purge -y -q unzip wget
