O que é **SSH** e como funciona?

  O **SSH** foi desenvolvido com o intuito de habilitar um canal de comunicação segura entre 2 equipamentos, um que faz o papel de cliente **SSH** (origem da conexão) e outro que faz o papel de servidor **SSH** (destino da conexão), utilizando [criptografia de chave pública](https://medium.com/r/?url=https%3A%2F%2Fpt.wikipedia.org%2Fwiki%2FCriptografia_de_chave_p%25C3%25BAblica) ou criptografia assimétrica.

- Para essa etapa vamos utilizar o usuário

- Uso simples e direto

Para logar no computador remoto (o que faz o papel de servidor **SSH**) com o mesmo usuário logado localmente (a partir do computador que faz o papel de cliente **SSH**), simplesmente use:

```plain
ssh node01
```{{exec}}

> Observe que não foi solicitado nenhuma senha! Isso aconteceu porque esse usuário já está com tudo configurado.
>
>
> Mas não se preocupe, vamos aprender a fazer essa configuração em breve!

Repare que o prompt do terminal mudou para `node01 $`{{}} sinalizando que estamos em outro computador.

Para confirmar com qual usuário efetuamos essa conexão utilize o seguinte comando:

```bash
whoami
```{{exec}}

Para retornar ao computador cliente, o que iniciou a conexão, digite `exit`{{exec}}.


Vamos alterar para o usuário `ubuntu`, com o seguinte comando:

```bash
su - ubuntu
```{{exec}}

O prompt de comando irá alterar para:

```bash
ubuntu@controlplane:~$
```
