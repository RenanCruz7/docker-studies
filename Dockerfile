# Devemos sempre criar uma imagem a partir de uma imagem base
# Neste caso, vamos usar a imagem oficial do Node.js
FROM    node:latest

# Definindo o diretório de trabalho dentro do container
# Isso significa que todos os comandos seguintes serão executados nesse diretório
WORKDIR     /app

# Copiando o arquivo package.json e package-lock.json para o diretório de trabalho
COPY . .

# Executando o comando para inicializar o projeto Node.js
CMD [ "node", "index.js" ]