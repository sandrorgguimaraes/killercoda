USUARIO="ubuntu1"
SENHA="$(openssl passwd -1 $USUARIO)"
CMD="$(cat <<EOF
useradd -m -s /usr/bin/bash -p $SENHA $USUARIO;
EOF
)"
useradd -m -s /usr/bin/bash -p $SENHA $USUARIO;
ssh node01 $CMD;

