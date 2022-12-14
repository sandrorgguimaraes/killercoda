O **SSH** foi desenvolvido com o intuito de habilitar um canal de comunicação segura entre 2 equipamentos, um que faz o papel de cliente **SSH** (origem da conexão) e outro que faz o papel de servidor **SSH** (destino da conexão), utilizando [criptografia de chave pública](https://medium.com/r/?url=https%3A%2F%2Fpt.wikipedia.org%2Fwiki%2FCriptografia_de_chave_p%25C3%25BAblica) ou criptografia assimétrica.

![SSH](./ssh.png)
Fonte.: <https://www.hostinger.com.br/tutoriais/como-funciona-o-ssh>

## Antes de começar

Este ambiente interativo tem algumas funcionalidades interessantes para quem não quiser digitar os comandos.

Vamos dar alguns exemplos:

- Pare o mouse sobre o comando `ls -la`{{}} abaixo e vai aparecer o texto `copy`{{}}, indicando que ao clicar sobre o mesmo ele será copiado para a área de transferência, daí é só clicar com o botão direito do mouse na área do terminal ao lado e escolher a opção `Colar`{{}}.

```bash
ls -la
```{{copy}}

- Agora no comando abaixo, ao parar o mouse sobre ele, vai aparecer o texto `exec`{{}}, indicando que ao clicar sobre o mesmo ele já será executado no terminal ao lado.

```bash
clear
```{{exec}}

> Portanto fique a vontade para digitar o comando ou usar esta funcionalidade do ambiente. 

## Uso simples e direto

Para essa etapa vamos utilizar o usuário `ubuntu1`{{}}. Utilize o comando abaixo para mudarmos de usuário:

```bash
su - ubuntu1
```{{exec}}

> Observe que o prompt de comando alterou para `ubuntu1@controlplane:~$`{{}} indicando que agora estamos trabalhando com o usuário `ubuntu1`{{}} **ainda no computador local** chamado de `controlplane`{{}}.

Para logarmos em outro computador (o que faz o papel de servidor **SSH**) com um usuário com o mesmo nome do que está logado localmente, simplesmente usamos o comando abaixo:

```bash
ssh node01
```{{exec}}

Como é a primeira conexão à este computador, será perguntado se queremos armazenar localmente a [chave ECDSA](https://medium.com/r/?url=https%3A%2F%2Fpt.wikipedia.org%2Fwiki%2FECDSA) deste computador conforme abaixo.

```bash
The authenticity of host 'node01 (172.30.2.2)' can't be established.
ECDSA key fingerprint is SHA256:OvIkq0qqws0HP70HLCCdX31wLWoI/yvcN+sCCN3Krts.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```{{}}

Responda `yes`{{exec}}.

```bash
Warning: Permanently added 'node01,172.30.2.2' (ECDSA) to the list of known hosts.
```{{}}

Será apresentada uma mensagem confirmando que a chave ECDSA do `node01`{{}} foi adicionada permanentemente.

> Estas chaves são armazenadas no arquivo `/home/ubuntu1/.ssh/known_hosts`{{}}.

E na sequencia se pede a senha de login do usuário `ubuntu1`{{}} no computador `node01`{{}}.

```bash
ubuntu1@node01's password:
```{{}}

Informe a senha `ubuntu1`{{exec}}.

> Agora o prompt de comando deve ser `ubuntu1@node01:~$`{{}} indicando que estamos trabalhando com o usuário `ubuntu1`{{}} **só que no computador** `node01`{{}}.

Para retornarmos ao computador de origem digite:

```bash
exit
```{{exec}}

> Observe que o prompt de comando retornará para `ubuntu1@controlplane:~$`{{}}.

Pronto! Viu como é fácil acessarmos um computador remoto de forma segura com o SSH?

## Conectando com outro usuário

Para acessarmos o computador remoto com um usuário diferente do que está logado localmente, basta informar o nome do mesmo seguido de um '**@**' antes do nome do computador, conforme exemplo abaixo:

```bash
ssh ubuntu@node01
```{{exec}}

> Percebeu que não foi perguntado sobre a chave ECDSA do `node01`{{}}? Porque já temos a mesma armazenada localmente.

Ao ser solicitada a senha de login informe:

```bash
ubuntu
```{{exec}}

> Repare que agora o prompt de comando é `ubuntu@node01:~$`{{}} indicando que estamos trabalhando com o usuário **`ubuntu`{{}}** no computador `node01`{{}}.

Para retornarmos ao computador de origem, digite:

```bash
exit
```{{exec}}

> Observe que o prompt de comando retornará para `ubuntu1@controlplane:~$`{{}}.

Show! Vamos em frente.
