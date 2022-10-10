USUARIO="ubuntu1"
SENHA="ubuntu1"
sudo useradd -m -s /usr/bin/bash -p $(openssl passwd -1 $SENHA) $USUARIO
ssh node01 sudo useradd -m -s /usr/bin/bash -p $(openssl passwd -1 $SENHA) $USUARIO
