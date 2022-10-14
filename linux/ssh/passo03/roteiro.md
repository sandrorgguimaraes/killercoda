Para copiar a chave pública para um computador remoto é super simples, vamos usar o comando `ssh-copy-id`{{}}.

## Antes de começar

> Certifique-se que esteja logado com o usuário `ubuntu1`{{}} no computador `controlplane`{{}}, para tanto o prompt de comando deve ser `ubuntu1@controlplane:~$`{{}}.

Vamos limpar a tela antes de prosseguir.

```bash
clear
```{{exec}}

## Copiando a chave pública

Para iniciar o processo use o comando abaixo:

```bash
ssh-copy-id node01
```

Como não especificamos qual chave pública copiar para o computador remoto, será utilizada a chave padrão criada anteriormente.

```bash
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ubuntu1/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
```{{}}

#TODO

Se for a primeira conexão a este computador será exibida a mensagem abaixo

Em linhas gerais 'Não pudemos validar a autenticidade do node01, você confia nele? podemos continuar?', se você responder que sim a chave ECDSA do computador remoto será gravada no arquivo de computadores conhecidos /home/sandro/.ssh/known_hosts do computador local.

```bash
The authenticity of host 'node01 (172.30.2.2)' can't be established.
ECDSA key fingerprint is SHA256:OvIkq0qqws0HP70HLCCdX31wLWoI/yvcN+sCCN3Krts.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
```{{}}


```bash
ubuntu1@node01's password: 
```{{}}

Informe a senha `ubuntu1`{{exec}}.