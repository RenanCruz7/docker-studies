# Devemos sempre criar uma imagem a partir de uma imagem base
# Neste caso, vamos usar a imagem oficial do Node.js
# ARG so funciona no build time, não no runtime
ARG NODE_VERSION=20.16.0
FROM node:${NODE_VERSION}

# Pode definir varias variáveis de ambiente
# Essas variáveis podem ser acessadas pelo código Node.js
ENV PORT = 3001
ENV MESSAGE = "Hello World from Docker!"


# Definindo o diretório de trabalho dentro do container
# Isso significa que todos os comandos seguintes serão executados nesse diretório
WORKDIR     /app

# Copiando o arquivo package.json e package-lock.json para o diretório de trabalho
COPY . .

# Executando o comando para inicializar o projeto Node.js
CMD [ "node", "index.js" ]