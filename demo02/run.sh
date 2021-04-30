# instalar o pacote do Serverless
npm i -g serverless

# Checa a versão e se está tudo ok
sls -v

# Inicializar com sls
sls


# Faz o deploy para o ambiente para validar se está tudo certo
sls deploy

# sls
sls invoke -f hello

# sls local
sls invoke local -f hello

# logs
sls logs -f hello -t

# para remover tudo
sls remove

