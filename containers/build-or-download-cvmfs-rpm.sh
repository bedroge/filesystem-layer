arch=$(uname -m)

yum install -y wget
if [ "$arch" = "ppc64le" ]
then
    yum install -y epel-release
    yum install -y rpm-build checkpolicy cmake fuse-devel fuse3-devel gcc gcc-c++ golang libattr-devel libcap-devel libuuid-devel openssl-devel python2-devel python2-setuptools selinux-policy-devel valgrind-devel hardlink selinux-policy-targeted
    wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-2.8.1/cvmfs-2.8.1-1.el7.src.rpm && rpmbuild --rebuild cvmfs-2.8.1-1.el7.src.rpm
else
    mkdir -p /root/rpmbuild/RPMS/${arch}
    cd /root/rpmbuild/RPMS/${arch}
    wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-2.8.1/cvmfs-2.8.1-1.el7.${arch}.rpm
fi
