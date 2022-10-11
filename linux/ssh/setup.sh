USUARIO="ubuntu1";
SENHA="$(openssl passwd -1 $USUARIO)";
echo "Criando o usuário 'ubuntu1'...";
sudo useradd -m -s /usr/bin/bash -p "$SENHA" "$USUARIO";
ssh node01 'sudo useradd -m -s /usr/bin/bash -p "$SENHA" "$USUARIO"';
