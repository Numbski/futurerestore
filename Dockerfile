FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/pkgconfig
RUN apt-get update && apt-get install -y build-essential checkinstall libtool libtool-bin autoconf automake libssl-dev usbmuxd g++ python-dev libzip-dev libcurl4-openssl-dev cmake libssl-dev libusb-1.0-0-dev libusb-1.0-0 libreadline-dev libbz2-dev libpng-dev git wget pkg-config
RUN git clone https://github.com/lzfse/lzfse
RUN git clone https://github.com/libimobiledevice/libirecovery
RUN git clone https://github.com/LukeZGD/libgeneral
RUN git clone https://github.com/LukeZGD/libfragmentzip
RUN git clone https://github.com/LukeZGD/img4tool
RUN git clone https://github.com/libimobiledevice/libimobiledevice.git
RUN git clone https://github.com/libimobiledevice/libusbmuxd.git
RUN git clone https://github.com/libimobiledevice/libplist.git
RUN git clone --recursive https://github.com/marijuanARM/futurerestore
RUN cd lzfse && make && make install install_root=/usr && cd ..
RUN cd libirecovery && ./autogen.sh --prefix=/usr && make && make install && cd ..
RUN cd libgeneral && ./autogen.sh  --prefix=/usr && make && make install && cd ..
RUN cd libfragmentzip && ./autogen.sh  --prefix=/usr && make && make install && cd ..
RUN cd libplist && ./autogen.sh  --prefix=/usr && make && make install && cd ..
RUN cd img4tool && ./autogen.sh  --prefix=/usr && make && make install && cd ..
RUN cd libusbmuxd && ./autogen.sh  --prefix=/usr && make && make install && cd ..
RUN cd libimobiledevice && ./autogen.sh  --prefix=/usr && make && make install && cd ..
#RUN ls -alhs /usr/local/lib/pkgconfig
#RUN ls -alhs /usr/local/lib
#RUN ls -alhs /usr/lib
#RUN ls -alhs /usr/lib/pkgconfig
#RUN ls -alhs /usr/lib/x86_64-linux-gnu/pkgconfig
#RUN cat /usr/lib/x86_64-linux-gnu/pkgconfig/libplist.pc
RUN cd futurerestore/external/idevicerestore && wget https://gist.github.com/LukeZGD/a4cf72c23924d88af4a53a52870d3b9d/raw/7038d8c8ffe287d9ebe2bef2d8fa5bfa799c1c1a/idevicerestore.patch && git apply idevicerestore.patch && cd ../.. && ./autogen.sh --prefix=/usr && make && make install && cd ..
CMD ["sleep", "infinity"]
