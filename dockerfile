FROM moussavdb/build-java:17

LABEL maintainer="Grégory Van den Borre vandenborre.gregory@hotmail.fr"

ENV TZ=Europe/Brussels
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install -y -q --fix-missing git make gcc g++ libc-dev pkg-config cmake-data dpkg-dev mingw-w64 cmake python3 libxaw7-dev libxrandr-dev libgl1-mesa-dev libglu1-mesa-dev autoconf automake libtool texinfo gperf git2cl

COPY /deploy-native-maven-central.sh /build-resources

RUN chmod +x /build-resources/deploy-native-maven-central.sh

ENTRYPOINT ../build-resources/deploy-native-maven-central.sh
