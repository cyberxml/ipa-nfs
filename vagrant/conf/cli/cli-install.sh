yum -y update

cp /vagrant/conf/cli/hosts /etc/hosts

# -----------------------------------------------------------------------------
# nfs mount points
# -----------------------------------------------------------------------------
mkdir /mnt/net
chmod 777 /mnt/net

# nfs debug logging
cp /vagrant/conf/cli/sysconfig.nfs /etc/sysconfig/nfs

# -----------------------------------------------------------------------------
# free ipa client
# -----------------------------------------------------------------------------
yum -y install freeipa-client

