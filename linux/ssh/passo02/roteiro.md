Para evitarmos a digitação da senha de login a cada nova conexão sem prejudicar a segurança na comunicação, primeiro é necessário criarmos o nosso par de chaves (apenas uma vez) e posteriormente copiarmos a chave pública para os computadores remotos.

## Antes de começar

Vamos só confirmar que não temos nenhum par de chaves criado no momento.

> Certifique-se que esteja logado com o usuário `ubuntu1`{{}} no computador `controlplane`{{}}, para tanto o prompt de comando ser `ubuntu1@controlplane:~$`{{}}.

Voltando para a pasta `$HOME`{{}} do usuário `ubuntu1`{{}}, digite:

```bash
cd
```

E liste as pastas existentes:

```bash
ls -la
```

> Observe que não temos uma pasta `.ssh`{{}}, ela será criada durante a execução do próximo comando.

## Criando o par de chaves

Para a criação do par de chaves **SSH** (pública e privada) utilizamos o comando `ssh-keygen`{{}}.

> No nosso exemplo não iremos passar parâmetros e vamos aceitar as opções padrões.

Vamos lá então, inicie o processo digitanto o comando abaixo:

```bash
ssh-keygen
```{{exec}}

Será apresentado uma mensagem informando que será gerada uma senha do tipo RSA e pedindo para confirmar o nome do arquivo que será gravada. Tecle **ENTER** para confirmar.

```bash
Generating public/private rsa key pair.
Enter file in which to save the key (/home/ubuntu1/.ssh/id_rsa): 
```{{}}

Neste momento a pasta `/home/ubuntu1/.ssh`{{}} é criada e é solicitada a digitação de uma senha de proteção, conforme abaixo.

```bash
Enter passphrase (empty for no passphrase): 
```{{}}

Por hora não vamos informar essa senha, pode teclar **ENTER** para deixar em branco.

Quando pedir para confirmar a senha com a mensagem `Enter same passphrase again:`{{}}, como deixamos em branco pode teclar **ENTER** novamente.

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

Vamos acessar a pasta que foi criada durante o processo acima e listar os arquivos criados, com os comandos abaixo.

```bash
cd ~/.ssh
ls -la
```{{exec}}

Observe o resultado.

```bash
ubuntu1@controlplane:~$ cd ~/.ssh/
ubuntu1@controlplane:~/.ssh$ ls -la
total 16
drwx------ 2 ubuntu1 ubuntu1 4096 Oct 14 00:31 .
drwxr-xr-x 3 ubuntu1 ubuntu1 4096 Oct 14 00:25 ..
-rw------- 1 ubuntu1 ubuntu1 2610 Oct 14 00:31 id_rsa
-rw-r--r-- 1 ubuntu1 ubuntu1  574 Oct 14 00:31 id_rsa.pub
```{{}}

Observe que a chave privada **`id_rsa`{{}}** está configurada para acesso restrito ao proprietário `ubuntu1`{{}}, enquanto a chave pública **`id_rsa.pub`{{}}** tem a leitura liberada para qualquer usuário.

> ***Lembre-se.:** Se alguém tiver acesso às suas chaves pública e privada, poderá logar nos computadores remotos com seu usuário. Para mitigar esse risco é recomendável que no processo de criação, visto acima, seja informada a senha de proteção.*

Para conhecer todas as opções disponíveis na criação das chaves SSH, execute `man ssh-keygen`.

Pronto! Primeira etapa concluída, vamos seguir em frente! Bom trabalho!
