Para simplificarmos o processo de login evitando a digitação da senha a cada nova conexão, vamos criar um par de chaves (apenas uma vez) e posteriormente copiaremos a chave pública para os computadores remotos.

## Antes de começar

Vamos confirmar que não temos nenhum par de chaves criado no momento.

> Certifique-se que esteja logado com o usuário `ubuntu1`{{}} no computador `controlplane`{{}}, para tanto o prompt de comando deve ser `ubuntu1@controlplane:~$`{{}}.

Vamos limpar a tela, voltar para a pasta `$HOME`{{}} do usuário `ubuntu1`{{}} e listar seu conteúdo:

```bash
clear
cd
ls -la
```{{exec}}

O resultado deve ser:

```bash
total 24
drwxr-xr-x 3 ubuntu1 ubuntu1 4096 Oct 14 11:31 .
drwxr-xr-x 4 root    root    4096 Oct 14 11:30 ..
-rw-r--r-- 1 ubuntu1 ubuntu1  220 Feb 25  2020 .bash_logout
-rw-r--r-- 1 ubuntu1 ubuntu1 3771 Feb 25  2020 .bashrc
-rw-r--r-- 1 ubuntu1 ubuntu1  807 Feb 25  2020 .profile
drwx------ 2 ubuntu1 ubuntu1 4096 Oct 14 11:31 .ssh
```{{}}

Observe que temos uma pasta `.ssh`{{}}, vamos ver o conteúdo dela:

```bash
ls -la .ssh/
```{{exec}}

O resultado deve ser:

```bash
total 12
drwx------ 2 ubuntu1 ubuntu1 4096 Oct 14 11:31 .
drwxr-xr-x 3 ubuntu1 ubuntu1 4096 Oct 14 11:31 ..
-rw-r--r-- 1 ubuntu1 ubuntu1  444 Oct 14 11:31 known_hosts
```{{}}

Este arquivo `/home/ubuntu1/.ssh/known_hosts`{{}} foi criado no passo anterior e armazena as chaves públicas dos computadores que nos conectamos anteriormente, se quiser ver o conteúdo desse arquivo use o comando abaixo:

```bash
cat /home/ubuntu1/.ssh/known_hosts
```{{exec}}

> Observe que não temos outros arquivos nesta pasta.

## Criando o par de chaves

Para a criação do par de chaves **SSH** (pública e privada) utilizamos o comando `ssh-keygen`{{}}.

> No nosso exemplo não iremos passar parâmetros e vamos aceitar as opções padrões.

Inicie o processo usando o comando abaixo:

```bash
ssh-keygen
```{{exec}}

Será apresentado uma mensagem informando que será gerada uma senha do [tipo RSA](https://pt.wikipedia.org/wiki/RSA_(sistema_criptogr%C3%A1fico)) e pedindo para confirmar o nome e local do arquivo em que será gravada.

```bash
Generating public/private rsa key pair.
Enter file in which to save the key (/home/ubuntu1/.ssh/id_rsa): 
```{{}}

Tecle **ENTER** para confirmar.

> Neste momento se a pasta `/home/ubuntu1/.ssh`{{}} não existisse seria criada.

É solicitada a digitação de uma senha de proteção conforme abaixo.

```bash
Enter passphrase (empty for no passphrase): 
```{{}}

Por hora não vamos informar essa senha de proteção, então pode teclar **ENTER** para deixar em branco.

Vai ser solicitado para confirmar a senha com a mensagem `Enter same passphrase again:`{{}}.

Como deixamos em branco pode teclar **ENTER** novamente.

Por fim é exibida as informações abaixo, contendo o nome dos arquivos criados, a impressão digital e a imagem randômica da chave.

```bash
Your identification has been saved in /home/ubuntu1/.ssh/id_rsa
Your public key has been saved in /home/ubuntu1/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:MBCu6OPSNVFjNxjLHgQNGMby9rQVmm/IggiMI8T4TmE ubuntu1@controlplane
The key's randomart image is:
+---[RSA 3072]----+
|o.oo==oo         |
|o+E. +B.o        |
|+= ..=*+ .       |
|=o=.=..+         |
|=*.+ *. S        |
|+ o B o          |
| + o o           |
|o o              |
|..               |
+----[SHA256]-----+
```{{}}

## Verificando o resultado desse processo

Vamos acessar a pasta `.ssh`{{}} e listar o seu conteúdo atual, com os comandos abaixo.

```bash
cd ~/.ssh
ls -la
```{{exec}}

Observe que além do arquivo `known_hosts`{{}}, temos 2 novos arquivos.

- A chave privada **`id_rsa`{{}}** que está configurada para acesso restrito **`rw-------`{{}}** ao proprietário **`ubuntu1`{{}}**;
- E a chave pública **`id_rsa.pub`{{}}** com permissão de leitura liberada para qualquer usuário **`rw-r--r--`{{}}**.

```bash
ubuntu1@controlplane:~$ cd ~/.ssh/
ubuntu1@controlplane:~/.ssh$ ls -la
total 20
drwx------ 2 ubuntu1 ubuntu1 4096 Oct 14 11:44 .
drwxr-xr-x 3 ubuntu1 ubuntu1 4096 Oct 14 11:31 ..
-rw------- 1 ubuntu1 ubuntu1 2610 Oct 14 11:44 id_rsa
-rw-r--r-- 1 ubuntu1 ubuntu1  574 Oct 14 11:44 id_rsa.pub
-rw-r--r-- 1 ubuntu1 ubuntu1  444 Oct 14 11:31 known_hosts
```{{}}

> ***Lembre-se.:** Se alguém tiver acesso às suas chaves pública e privada, poderá logar nos computadores remotos com seu usuário. Para mitigar esse risco é recomendável que no processo de criação, visto acima, seja informada a senha de proteção.*

Para conhecer todas as opções disponíveis na criação das chaves SSH, execute o comando:

```bash
man ssh-keygen
```

Bom trabalho! Primeira etapa concluída, vamos em frente!
