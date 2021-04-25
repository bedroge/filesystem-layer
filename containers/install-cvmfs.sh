cvmfsversion=$1
arch=$(uname -m)

if [ "$arch" = "ppc64le" ]
then
    yum install -y /root/rpmbuild/RPMS/ppc64le/cvmfs-${cvmfsversion}-1.el7.ppc64le.rpm \
                   /root/rpmbuild/RPMS/ppc64le/cvmfs-fuse3-${cvmfsversion}-1.el7.ppc64le.rpm \
                   http://ecsft.cern.ch/dist/cvmfs/cvmfs-config/cvmfs-config-default-latest.noarch.rpm
else
    yum install -y http://cvmrepo.web.cern.ch/cvmrepo/yum/cvmfs-release-latest.noarch.rpm \
    && yum install -y cvmfs-${cvmfsversion} cvmfs-config-default cvmfs-fuse3 sudo vim openssh-clients
fi
