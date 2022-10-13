sudo useradd -m -s /usr/bin/bash -p $(openssl passwd -1 ubuntu1) ubuntu1;
ssh node01 sudo useradd -m -s /usr/bin/bash -p $(openssl passwd -1 ubuntu1) ubuntu1;

