Vamos finalizar nossos exercícios automatizando a execução de comandos remotamente, criando dentro de um script o código que será enviado para execução remota.

## Antes de começar

> Certifique-se que esteja logado com o usuário `ubuntu1`{{}} no computador `controlplane`{{}}, para tanto o prompt de comando deve ser `ubuntu1@controlplane:~/.ssh$`{{}}.

```bash
clear
```{{exec}}

## Conhecendo o script de exemplo

Primeiro vamos limpar a tela, voltar à pasta `$HOME`{{}} e copiar o script que está na pasta `/tmp`{{}}, com os comandos abaixo:

```bash
clear
cd
cp /tmp/script02.sh .
```{{exec}}

Vamos conferir o conteúdo do script e ver o que ele irá fazer. Para tanto use o comando abaixo:

> A opção `-n`{{}} do comando `cat`{{}} irá imprimir o número da linha à esquerda, para facilitar a nossa leitura.

```bash
cat -n script02.sh
```{{exec}}

- A primeira linha imprime uma mensagem com o nome do computador local;
- Entre as linha 3 e 10 criamos a variável `CMD_SSH`{{}} com o conteúdo do script que será executado no computador remoto;
  - Para melhorar a legibilidade do código gravado na variável `CMD_SSH`{{}}, foi utilizado o recurso [Here Document](https://medium.com/r/?url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FHere_document) com o delimitador **EOF** (que podeira ter sido qualquer outro) e assim termos uma string com múltiplas linhas;
- Na linha 12 fazemos uma conexão **SSH** simples como já aprendemos anteriormente, enviando os comandos armazenados na variável `CMD_SSH`{{}};
- E pra finalizar, na linha 14, imprimimos uma nova mensagem com o nome do computador local.

## Executando o script

Vamos executar esse script com o comando abaixo:

```bash
./script02.sh
```{{exec}}

O resultado deve ser parecido com...

```bash
Aqui estamos no computador local 'controlplane'.
Agora estamos no computador remoto 'node01'.
Wed Oct 19 00:26:41 UTC 2022
Wed Oct 19 00:26:42 UTC 2022
Wed Oct 19 00:26:43 UTC 2022
Wed Oct 19 00:26:44 UTC 2022
Wed Oct 19 00:26:45 UTC 2022
E voltamos para o computador local 'controlplane' de novo.
```{{}}

## Usando o `sudo`{{}}

> Não vamos entrar no mérito da configuração do acesso de super-usuário, isso fica para outra oportunidade.

Se um usuário qualquer executar um comando que necessita de privilegios de `root`{{}}, receberá uma mensagem acusando `Permission denied`{{}}.

Vamos testar com o comando abaixo:

```bash
ssh node01 wc -l /etc/shadow
```{{exec}}

O resultado será:

```bash
wc: /etc/shadow: Permission denied
```{{}}

Bom! Então vamos utilizar o `sudo`{{}} e conseguir fazer esta consulta, com o comando abaixo:

```bash
ssh node01 sudo wc -l /etc/shadow
```{{exec}}

Hum! Não era bem isso que a gente esperava:

```bash
sudo: a terminal is required to read the password; either use the -S option to read from standard input or configure an askpass helper
```{{}}

> Para termos acesso `sudo`{{}} é necessário confirmar nossa identidade digitando a senha do usuário, neste caso precisamos informar ao `ssh`{{}} para iniciar um terminal para esta digitação, isso conseguimos com a opção `-t`{{}}.

Vamos testar com o comando abaixo:

```bash
ssh -t node01 sudo wc -l /etc/shadow
```{{exec}}

Opa! Conseguimos fazer aparecer o prompt pedindo a senha.

Informe a senha `ubuntu1`{{exec}}.

Infelizmente o usuário `ubuntu1`{{}} não tem acesso de `sudo`{{}}, mas já vimos como fazer funcionar.

Vamos testar com um usuário com acesso agora? Digite o comando abaixo:

```bash
ssh -t ubuntu@node01 sudo wc -l /etc/shadow
```{{exec}}

Informe a senha `ubuntu`{{exec}}.

Perfeito! O resultado será:

```bash
36 /etc/shadow
Connection to node01 closed.
```{{}}

## Conclusão

Parabéns! Espero que estes exercícios tenham lhe ajudado a entender o funcionamento básico do SSH.

> Se quiser saber o que estou escrevendo ou estudando visite o meu [Diário de Bordo](https://sandrorgguimaraes.github.io/) e veja as novidades.

Tem alguma sugestão, dúvida ou quer relatar algum problema [clique aqui](https://github.com/sandrorgguimaraes/killercoda/issues/new?title=SSH%20-%20Contato%20imediato%20de%20primeiro%20grau).

