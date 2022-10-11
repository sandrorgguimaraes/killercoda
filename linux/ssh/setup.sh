USUARIO="ubuntu1";
SENHA="$(openssl passwd -1 $USUARIO)";
sudo useradd -m -s /usr/bin/bash -p $SENHA $USUARIO;
ssh node01 "sudo useradd -m -s /usr/bin/bash -p $SENHA $USUARIO";
