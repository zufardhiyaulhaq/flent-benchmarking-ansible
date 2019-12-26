KEY=ansible-ssh
FLAVOR=m1.xlarge

ssh root@10.100.100.200 /bin/bash << EOF
source /root/admin_rc
KEY=ansible-ssh
FLAVOR=m1.xlarge

openstack server create --security-group sg-standard --key-name ${KEY} --flavor ${FLAVOR} --image ubuntu-xenial --port internal0-1 vm-sndc-1 --availability-zone nova:zu-ovs-compute0
openstack server create --security-group sg-standard --key-name ${KEY} --flavor ${FLAVOR} --image ubuntu-xenial --port internal0-2 vm-sndc-2 --availability-zone nova:zu-ovs-compute1
openstack server add floating ip vm-sndc-1 10.102.102.225
openstack server add floating ip vm-sndc-2 10.102.102.226
EOF

sleep 240

cat << EOF > group_vars/all.yaml
scenario: sndc
# list avaliable: sndc, snsc, dndc, dnsc
type: rrul
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/sndc

cat << EOF > group_vars/all.yaml
scenario: sndc
# list avaliable: sndc, snsc, dndc, dnsc
type: tcp_download
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/sndc

cat << EOF > group_vars/all.yaml
scenario: sndc
# list avaliable: sndc, snsc, dndc, dnsc
type: tcp_upload
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/sndc

ssh root@10.100.100.200 /bin/bash << EOF
source /root/admin_rc
KEY=ansible-ssh
FLAVOR=m1.xlarge

openstack server remove floating ip vm-sndc-1 10.102.102.225
openstack server remove floating ip vm-sndc-2 10.102.102.226
openstack server delete vm-sndc-1 vm-sndc-2

sleep 20

openstack server create --security-group sg-standard --key-name ${KEY} --flavor ${FLAVOR} --image ubuntu-xenial --port internal0-1 vm-snsc-1 --availability-zone nova:zu-ovs-compute1
openstack server create --security-group sg-standard --key-name ${KEY} --flavor ${FLAVOR} --image ubuntu-xenial --port internal0-2 vm-snsc-2 --availability-zone nova:zu-ovs-compute1
openstack server add floating ip vm-snsc-1 10.102.102.225
openstack server add floating ip vm-snsc-2 10.102.102.226
EOF

sleep 240

cat << EOF > group_vars/all.yaml
scenario: snsc
# list avaliable: sndc, snsc, dndc, dnsc
type: rrul
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/snsc

cat << EOF > group_vars/all.yaml
scenario: snsc
# list avaliable: sndc, snsc, dndc, dnsc
type: tcp_download
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/snsc

cat << EOF > group_vars/all.yaml
scenario: snsc
# list avaliable: sndc, snsc, dndc, dnsc
type: tcp_upload
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/snsc

ssh root@10.100.100.200 /bin/bash << EOF
source /root/admin_rc
KEY=ansible-ssh
FLAVOR=m1.xlarge

openstack server remove floating ip vm-snsc-1 10.102.102.225
openstack server remove floating ip vm-snsc-2 10.102.102.226
openstack server delete vm-snsc-1 vm-snsc-2

sleep 20

openstack server create --security-group sg-standard --key-name ${KEY} --flavor ${FLAVOR} --image ubuntu-xenial --port internal0-1 vm-dnsc-1 --availability-zone nova:zu-ovs-compute1
openstack server create --security-group sg-standard --key-name ${KEY} --flavor ${FLAVOR} --image ubuntu-xenial --port internal1-1 vm-dnsc-2 --availability-zone nova:zu-ovs-compute1
openstack server add floating ip vm-dnsc-1 10.102.102.225
openstack server add floating ip vm-dnsc-2 10.102.102.226
EOF

sleep 240

cat << EOF > group_vars/all.yaml
scenario: dnsc
# list avaliable: sndc, snsc, dndc, dnsc
type: rrul
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/dnsc

cat << EOF > group_vars/all.yaml
scenario: dnsc
# list avaliable: sndc, snsc, dndc, dnsc
type: tcp_download
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/dnsc

cat << EOF > group_vars/all.yaml
scenario: dnsc
# list avaliable: sndc, snsc, dndc, dnsc
type: tcp_upload
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/dnsc

ssh root@10.100.100.200 /bin/bash << EOF
source /root/admin_rc
KEY=ansible-ssh
FLAVOR=m1.xlarge

openstack server remove floating ip vm-dnsc-1 10.102.102.225
openstack server remove floating ip vm-dnsc-2 10.102.102.226
openstack server delete vm-dnsc-1 vm-dnsc-2

sleep 20

openstack server create --security-group sg-standard --key-name ${KEY} --flavor ${FLAVOR} --image ubuntu-xenial --port internal0-1 vm-dndc-1 --availability-zone nova:zu-ovs-compute0
openstack server create --security-group sg-standard --key-name ${KEY} --flavor ${FLAVOR} --image ubuntu-xenial --port internal1-1 vm-dndc-2 --availability-zone nova:zu-ovs-compute1
openstack server add floating ip vm-dndc-1 10.102.102.225
openstack server add floating ip vm-dndc-2 10.102.102.226
EOF

sleep 240

cat << EOF > group_vars/all.yaml
scenario: dndc
# list avaliable: sndc, snsc, dndc, dnsc
type: rrul
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF

ansible-playbook main.yml -i hosts/dndc

cat << EOF > group_vars/all.yaml
scenario: dndc
# list avaliable: sndc, snsc, dndc, dnsc
type: tcp_download
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/dndc

cat << EOF > group_vars/all.yaml
scenario: dndc
# list avaliable: sndc, snsc, dndc, dnsc
type: tcp_upload
# list available: rrul, tcp_download, tcp_upload
ovnovs: "ovs"
# list available: "ovn", "ovs"
EOF
ansible-playbook main.yml -i hosts/dndc