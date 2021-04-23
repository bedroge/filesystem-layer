cvmfsversion=2.8.1
arch=$(uname -m)

if [ "$arch" = "ppc64le" ]
then
    yum install -y cmake wget make unzip patch valgrind bzip2 gcc gcc-c++ sqlite-devel python-devel \
                   libcap-devel libuuid-devel attr fuse-devel fuse3-devel zlib-devel openssl-devel

    # build CernVM-FS from source (no aarch64 Debian packages available)
    wget https://github.com/cvmfs/cvmfs/archive/cvmfs-${cvmfsversion}.tar.gz && \
    tar xfz cvmfs-${cvmfsversion}.tar.gz && \
    cd cvmfs*${cvmfsversion}/ && \
    mkdir build && \
    cd build && \
    cmake .. -DBUILD_SERVER=no -DBUILD_SERVER_DEBUG=no -DDBUILD_SHRINKWRAP=no && \
    make -j $(nproc) && \
    sudo make install && \
    cd / && \
    rm -r cvmfs*${cvmfsversion}*

    yum remove -y fuse && yum install -y fuse3
else
    yum install -y http://cvmrepo.web.cern.ch/cvmrepo/yum/cvmfs-release-latest.noarch.rpm \
    && yum install -y cvmfs cvmfs-config-default cvmfs-fuse3 sudo vim openssh-clients
fi
