# Devemos sempre criar uma imagem a partir de uma imagem base
# Neste caso, vamos usar a imagem oficial do Node.js
# ARG so funciona no build time, não no runtime
ARG NODE_VERSION=20.16.0
#FROM node:${NODE_VERSION}
# A imagem alpine é uma versão menor e mais leve da imagem oficial do Node.js
FROM node:${NODE_VERSION}-alpine 

# Pode definir varias variáveis de ambiente
# Essas variáveis podem ser acessadas pelo código Node.js
# O Env pode ser acessado pelo código Node.js através de process.env.VARIABLE_NAME para se utilizar dentro do container
ENV PORT=3001
ENV MESSAGE="Hello World from Docker!"

#instalando o curl em um container baseado em debian
#RUN apt-get update && apt-get install -y curl && apt-get clean

#Caso esteja utilizando o alpine, o curl não vem por padrão
RUN apk add --no-cache curl

# Criando um usuário não root para executar o Node.js
# Isso é uma boa prática de segurança, pois evita que o Node.js seja executado como root
#RUN useradd -m mynode
#USER mynode

# Definindo o diretório de trabalho dentro do container
# Isso significa que todos os comandos seguintes serão executados nesse diretório
WORKDIR     /app

# Cache nos layers do docker 
# Isso significa que o docker só vai baixar as dependências novamente se o package.json mudar
# Isso é útil para evitar que o docker baixe as dependências toda vez que o código mudar
# Copiando o arquivo package.json e package-lock.json para o diretório de trabalho
# Isso é útil para evitar que o docker baixe as dependências toda vez que o código mudar
COPY package.json ./

RUN npm install 

# Copiando o arquivo package.json e package-lock.json para o diretório de trabalho
COPY . .

HEALTHCHECK --interval=10s --timeout=5s --start-period=5s --retries=3 CMD [ "curl","-f","http://localhost:3001" ] || exit 1

VOLUME [ "/data" ]

# Executando o comando para inicializar o projeto Node.js
CMD [ "node", "index.js" ]