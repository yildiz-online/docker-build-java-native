FROM moussavdb/build-java:18

LABEL maintainer="Grégory Van den Borre vandenborre.gregory@hotmail.fr"

ENV TZ=Europe/Brussels
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install -y -q git make gcc g++ libc-dev pkg-config cmake-data dpkg-dev mingw-w64 cmake unzip python3 libxaw7-dev libxrandr-dev libgl1-mesa-dev libglu1-mesa-dev wget autoconf automake libtool texinfo gperf git2cl \
&& wget http://sonarcloud.io/static/cpp/build-wrapper-linux-x86.zip \
&& unzip build-wrapper-linux-x86.zip -d /home \
&& cp /home/build-wrapper-linux-x86/* /usr/local/bin \
&& rm -R /home/build-wrapper-linux-x86 \
&& apt-get purge -y -q unzip wget

COPY /deploy-native-maven-central.sh /build-resources

RUN chmod 777 /build-resources/deploy-native-maven-central.sh

ENTRYPOINT ../build-resources/deploy-native-maven-central.sh
