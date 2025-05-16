# Devemos sempre criar uma imagem a partir de uma imagem base
# Neste caso, vamos usar a imagem oficial do Node.js
# ARG so funciona no build time, não no runtime
ARG NODE_VERSION=20.16.0
FROM node:${NODE_VERSION}

# Pode definir varias variáveis de ambiente
# Essas variáveis podem ser acessadas pelo código Node.js
# O Env pode ser acessado pelo código Node.js através de process.env.VARIABLE_NAME para se utilizar dentro do container
ENV PORT=3001
ENV MESSAGE="Hello World from Docker!"


# Criando um usuário não root para executar o Node.js
# Isso é uma boa prática de segurança, pois evita que o Node.js seja executado como root
RUN useradd -m mynode
USER mynode


# Definindo o diretório de trabalho dentro do container
# Isso significa que todos os comandos seguintes serão executados nesse diretório
WORKDIR     /app

# Copiando o arquivo package.json e package-lock.json para o diretório de trabalho
COPY . .

# Executando o comando para inicializar o projeto Node.js
CMD [ "node", "index.js" ]