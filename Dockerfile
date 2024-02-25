# Utilisez une image Node.js Alpine
ARG NODE_VERSION=18.17.1
FROM node:${NODE_VERSION}-alpine

# Utilisez l'environnement de production par défaut.
ENV NODE_ENV production

# Créez et définissez le répertoire de travail
WORKDIR /client

# Copiez les fichiers package.json et package-lock.json pour installer les dépendances
COPY package*.json  /client/

# Installez les dépendances
RUN npm install

# # Définissez l'utilisateur non-root
# USER node

# # Créez le répertoire de cache avec les bonnes permissions
# RUN mkdir -p /app/node_modules/.cache && chown -R node:node /app

# Copiez le reste des fichiers source dans l'image
COPY . /client/

# Exposez le port sur lequel l'application React s'exécute généralement
EXPOSE 3000

# Commande pour démarrer l'application React
CMD ["npm", "start"]
