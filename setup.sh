#!/bin/sh
set -e

function install_ansible {
    echo "Installing ansible 1.9.1..."
    sudo pip install -U ansible==1.9.1
}

function install_pip {
    echo "Installing pip..."
    sudo easy_install pip
}

function install_virtualenv {
    echo "Installing virtualenv..."
    sudo pip install -U virtualenv==13
}

function ensure {
    command -v $1 >/dev/null 2>&1 || { $2; }
}

function run_playbook {
    ansible-playbook playbook.yml --ask-become-pass
}

ensure "python2.7" python_missing
ensure "pip" install_pip
ensure "virtualenv" install_virtualenv
ensure "ansible-playbook" install_ansible

run_playbook

