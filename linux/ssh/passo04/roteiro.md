Se soubermos antecipadamente o que precisamos fazer no computador remoto e quisermos agilizar um pouco mais o processo, podemos utilizar o SSH da seguinte forma:

```bash
ssh nome-do-computador.exemplo.com.br [COMANDO|SCRIPT]
```{{}}

## Antes de começar

> Certifique-se que esteja logado com o usuário `ubuntu1`{{}} no computador `controlplane`{{}}, para tanto o prompt de comando deve ser `ubuntu1@controlplane:~/.ssh$`{{}}.

Vamos limpar a tela antes de prosseguir.

```bash
clear
```{{exec}}

## Apenas um comando, super simples

Só pra efeito didático, vamos consultar o nome do computador remoto com o comando abaixo:

```bash
ssh node01 hostname
```{{exec}}

O resultado deve ser o seguinte

```bash
node01
```{{}}

> Como já tínhamos enviado nossa chave pública para o `node01`{{}}, não foi solicitado a digitação da senha de login, o comando foi **executado remotamente** e a conexão foi finalizada.

Vamos agora consultar o conteúdo de um arquivo que está no computador remoto, com o seguinte comando.

```bash
ssh node01 cat /etc/resolv.conf
```{{exec}}

O resultado deve ser parecido com...

```bash
# This file is managed by man:systemd-resolved(8). Do not edit.
#
# This is a dynamic resolv.conf file for connecting local clients directly to
# all known uplink DNS servers. This file lists all configured search domains.
#
# Third party programs must not access this file directly, but only through the
# symlink at /etc/resolv.conf. To manage man:resolv.conf(5) in a different way,
# replace this symlink by a static file or a different symlink.
#
# See man:systemd-resolved.service(8) for details about the supported modes of
# operation for /etc/resolv.conf.

nameserver 8.8.8.8
nameserver 1.1.1.1
```{{}}

## Mais de um comando, ainda é simples

Para executar mais de um comando na mesma conexão, precisamos passar os comandos como se fossem uma única string, colocando-os entre aspas duplas `"` e separando os comandos com um ponto e virgula `;`.

Vamos testar este primeiro exemplo:

```bash
ssh node01 "sleep 3; hostname"
```{{exec}}

> Repare que houve uma espera de 3 segundos antes de exibir o nome do computador.

Vejamos este segundo exemplo:

```bash
ssh node01 "for i in {1..5}; do date; hostname; sleep 1; done"
```{{exec}}

Neste caso entre cada impressão da data e do nome do computador há uma espera de 1 segundo.

> Lembrando que o ';' (ponto e virgula) no Shell sinaliza que um comando terminou e um novo comando se inicia, dessa forma podemos enviar praticamente qualquer conjunto de comandos para o computador remoto.

Com base no artigo [SSH argument length](https://medium.com/r/?url=https%3A%2F%2Fwww.theeggeadventure.com%2Fwikimedia%2Findex.php%2FSsh_argument_length), para  verificar qual o tamanho máximo da string de comandos que podemos enviar para um determinado servidor **SSH**, execute o seguinte comando:

```bash
ssh node01 "getconf -a | grep ARG_MAX"
```{{exec}}

O resultado deve ser parecido com...

```bash
ARG_MAX                            2097152
_POSIX_ARG_MAX                     2097152
```{{}}

> *Neste caso podemos enviar uma string de comando com até 2MB de tamanho (2.097.152/1024/1024 = 2).*

## Enviando um script para execução remota

Vamos limpar a tela, voltar à pasta `$HOME`{{}} e copiar um script que está na pasta `/tmp`{{}}, com os comandos abaixo:

```bash
clear
cd
cp /tmp/script01.sh .
```{{exec}}

Se quiser conferir o conteúdo do script, use o comando...

```bash
cat script01.sh
```{{exec}}

Para executar esse script no computador remoto, use o seguinte comando:

```bash
ssh node01 < script01.sh
```{{exec}}

O resultado deve ser parecido com...

```bash
Pseudo-terminal will not be allocated because stdin is not a terminal.
Olá! Estamos na maquina 'node01'.
Tue Xxx 99 00:16:31 UTC 2022
Tue Xxx 99 00:16:32 UTC 2022
Tue Xxx 99 00:16:33 UTC 2022
Tue Xxx 99 00:16:34 UTC 2022
Tue Xxx 99 00:16:35 UTC 2022
```{{}}

Agora execute esse script localmente, com o comando abaixo.

```bash
./script01.sh
```{{exec}}

<blockquote style="background: #f8f5da;border-left: 10px solid #eedfbc;">
<p>Qual a diferença?</p>  
  <details><summary><b>Resposta.:</b></summary><br>
O nome do computador na primeira linha, indicando onde o script foi executado.
</details>
</blockquote>

# Qual a diferença?

# <details><summary><b>Resposta.:</b></summary><br>
# O nome do computador na primeira linha, indicando onde o script foi executado.
# </details><br>

Show! Com o básico que aprendemos até aqui, já é possível otimizar algumas tarefas do nosso dia a dia.

Vamos em frente e aprender algumas dicas mais.
