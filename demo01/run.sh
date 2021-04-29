#1 criar arquivo de politicas de segurança
#2 criar role de segurança na AWS

aws iam create-role \
  --role-name lambda-exemplo \
  --assume-role-policy-document file://policy.json \
  | tee logs/role.log


#3 Criar um arquivo .zip
zip function.zip index.js

aws lambda create-function \
  --function-name hello-cli \
  --zip-file fileb://function.zip \
  --handler index.handler \
  --runtime nodejs14.x \
  --role arn:aws:iam::426532314438:role/lambda-exemplo \
  | tee logs/lambda-create.log


#4 invocar a lambda
aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-exec.log


#5 Atualizar gera um novo arquivo .zip
zip function.zip index.js

#6 atualiza o lambda
aws lambda update-function-code \
  --zip-file fileb://function.zip \
  --function-name hello-cli \
  --publish \
  | tee logs/lambda-exec.log

#7 invoke
aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-exec-update.log

#8 remove function
aws lambda delete-function \
  --function-name hello-cli

#9 remove iam
aws iam delete-role \
  --role-name lambda-exemplo