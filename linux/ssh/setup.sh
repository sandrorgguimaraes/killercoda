# USUARIO="ubuntu1"
# SENHA="$(openssl passwd -1 $USUARIO)"
# useradd -m -s /usr/bin/bash -p $SENHA $USUARIO
# ssh node01 'useradd -m -s /usr/bin/bash -p $SENHA $USUARIO'

useradd -m -s /usr/bin/bash -p $(openssl passwd -1 ubuntu1) ubuntu1
ssh node01 'useradd -m -s /usr/bin/bash -p $(openssl passwd -1 ubuntu1) ubuntu1'