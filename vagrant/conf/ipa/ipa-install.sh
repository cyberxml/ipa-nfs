yum -y update

cp /vagrant/conf/ipa/hosts /etc/hosts
#cp /vagrant/conf/ipa/hostname /etc/hostname

# -----------------------------------------------------------------------------
# prepare dnsmasq for DNS services
# -----------------------------------------------------------------------------

yum -y install dnsmasq bind-utils net-tools
cp /vagrant/conf/ipa/dnsmasq.conf /etc/dnsmasq.conf

systemctl enable dnsmasq
systemctl start dnsmasq

# -----------------------------------------------------------------------------
# install free ipa for manual configuration
# -----------------------------------------------------------------------------

# http://wiki.linux-nfs.org/wiki/index.php/NFS_and_FreeIPA
yum -y install freeipa-server freeipa-admintools
