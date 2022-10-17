Para copiar a chave pública para um computador remoto é super simples, vamos usar o comando `ssh-copy-id`{{}}.

## Antes de começar

> Certifique-se que esteja logado com o usuário `ubuntu1`{{}} no computador `controlplane`{{}}, para tanto o prompt de comando deve ser `ubuntu1@controlplane:~/.ssh$`{{}}.

Vamos limpar a tela antes de prosseguir.

```bash
clear
```{{exec}}

## Copiando a chave pública

Para iniciar o processo use o comando abaixo:

```bash
ssh-copy-id node01
```{{exec}}

Como não especificamos qual chave pública copiar para o computador remoto, será utilizada a chave padrão criada anteriormente.

```bash
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ubuntu1/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
```{{}}

E é solicitada a senha de login do usuário `ubuntu1`{{}} no computador `node01`{{}}.

```bash
ubuntu1@node01's password:
```{{}}

Informe a senha `ubuntu1`{{exec}}.

Pronto! Sua chave pública foi copiada para o computador `node01`{{}} e a partir de agora não será mais solicitada a digitação da senha de login, conforme a mensagem abaixo.

```bash
Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'node01'"
and check to make sure that only the key(s) you wanted were added.
```{{}}

## Vamos aos testes

Vamos ver o que mudou no computador local?

Como continuamos na pasta `~/.ssh`{{}}, simplesmente use o comando abaixo para listar seu conteúdo.

```bash
la -la
```{{exec}}

> Localmente não houve mudanças!

Agora vamos acessar novamente o computador `node01`{{}} com o comando abaixo.

```bash
ssh node01
```{{exec}}

> Observe que não foi solicitado a digitação da senha de login!

Agora vamos limpar a tela e exibir o conteúdo da pasta `~/.ssh`{{}} do computador `node01`{{}}, com os comandos abaixo.

```bash
clear
cd ~/.ssh/
ls -la
```{{exec}}

O resultado deve ser parecido com...

```bash
total 12
drwx------ 2 ubuntu1 ubuntu1 4096 Xxx 99 11:04 .
drwxr-xr-x 3 ubuntu1 ubuntu1 4096 Xxx 99 11:04 ..
-rw------- 1 ubuntu1 ubuntu1  574 Xxx 99 11:04 authorized_keys
```{{}}

> Repare que o arquivo `authorized_keys`{{}} acabou de ser criado.

Este arquivo armazena as chaves públicas do usuário `ubuntu1`{{}}

Vamos conferir o conteúdo do mesmo?

```bash
cat authorized_keys
```{{exec}}

O resultado deve ser parecido com:

```bash
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDa0uA9zXT1x2NUex8IpvGzOmdhse+To9u9k7udA3YCnPMEpJRr6oDhixUUkmAXxS+6vu7xY7SBTguUrHYC4Y2zDoU2Y7SKzEfsQaXexoxFSskIAJFoNZDb+26YCxfglFRp1DETWF2+QSD8kKIj1bGBAfE0K0R7ymX0sjm2pJ7uM3M36qZjpHJfW0s8x8KJxhBtcIfwc2Wb/jme0dvlUqvaEJklyrwzY9QyO9SKN8sgxPDElEBCl4XpHgDZstfF6bF4iVjhZ1xfp4nJ5lZIQum69CReoVyFNeSRaRhfFZ/XaOVWr8Yznb8566IOPI/1XVd4vQ5I8uWKKMi0S8HLZgMVvL+Dp1LOGzN5kLFrixzDEXIxdK4p/14Q10k0eckcZbRfromL4v2fdwu7ZHd1sf7pQ7swLwJZvqCyHSNxZftYwcUZ3OH8u98cBGxucc7B5tPt4kECfjV2fb/wA/5/98JlsBPRcYuz4H4P21yVwxP2qQndXkUSr4Zxy1WAfXbEAyE= ubuntu1@controlplane
```{{}}

> Repare que no final da chave é indicado o usuário e computador de origem **`ubuntu1@controlplane`{{}}**.

Vamos retornar ao computador de origem com o comando abaixo:

```bash
exit
```{{exec}}

> Observe que o prompt de comando retornará para `ubuntu1@controlplane:~$`{{}}.

Show! Vamos em frente.
