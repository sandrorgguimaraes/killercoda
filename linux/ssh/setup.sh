USUARIO="ubuntu1";
COMANDO="sudo useradd -m -s /usr/bin/bash -p $(openssl passwd -1 $USUARIO) $USUARIO";
eval $COMANDO;
ssh node01 $COMANDO;
