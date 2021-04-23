cvmfsversion=2.8.1
arch=$(uname -m)

if [ "$arch" = "ppc64le" ]
then
    yum install -y ./ppc64le/cvmfs-2.8.1-1.el7.ppc64le.rpm ./ppc64le/cvmfs-fuse3-2.8.1-1.el7.x86_64.rpm
else
    yum install -y http://cvmrepo.web.cern.ch/cvmrepo/yum/cvmfs-release-latest.noarch.rpm \
    && yum install -y cvmfs-${cvmfsversion} cvmfs-config-default cvmfs-fuse3 sudo vim openssh-clients
fi
