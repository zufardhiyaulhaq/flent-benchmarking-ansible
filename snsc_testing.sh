echo << EOF > group_vars/all.yaml
scenario: snsc
# list avaliable: sndc, snsc, dndc, dnsc

type: rrul
# list available: rrul, tcp_download, tcp_upload

ovnovs: "ovn"
# list available: "ovn", "ovs"
EOF

ansible-playbook main.yml -i hosts/snsc

echo << EOF > group_vars/all.yaml
scenario: snsc
# list avaliable: sndc, snsc, dndc, dnsc

type: tcp_download
# list available: rrul, tcp_download, tcp_upload

ovnovs: "ovn"
# list available: "ovn", "ovs"
EOF

ansible-playbook main.yml -i hosts/snsc

echo << EOF > group_vars/all.yaml
scenario: snsc
# list avaliable: sndc, snsc, dndc, dnsc

type: tcp_upload
# list available: rrul, tcp_download, tcp_upload

ovnovs: "ovn"
# list available: "ovn", "ovs"
EOF

ansible-playbook main.yml -i hosts/snsc