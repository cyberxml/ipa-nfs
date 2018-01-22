yum -y update

cp /vagrant/conf/nfs/hosts /etc/hosts

yum -y install net-tools policycoreutils-python nfs-utils

#-----------------------------------------------------------------------------
# nfs server prep
#-----------------------------------------------------------------------------
#systemctl enable firewalld
#systemctl start firewalld
#firewall-cmd --permanent --zone public --add-service mountd
#firewall-cmd --permanent --zone public --add-service rpc-bind
#firewall-cmd --permanent --zone public --add-service nfs
#firewall-cmd --reload 

# export network shares
mkdir /net
chmod 777 /net

# https://www.tecmint.com/setting-up-nfs-server-with-kerberos-based-authentication/
semanage fcontext -a -t public_content_rw_t "/net(/.*)?"
restorecon -R /net
setsebool -P nfs_export_all_rw on
setsebool -P nfs_export_all_ro on

# set up the nfs root dir
cp /vagrant/conf/nfs/exports /etc
exportfs -arv

# enable debug logging
cp /vagrant/conf/nfs/sysconfig.nfs /etc/sysconfig/nfs

#-----------------------------------------------------------------------------
# freeipa client
#-----------------------------------------------------------------------------
yum -y install freeipa-client
