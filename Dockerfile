
# Image Size: 221MB
# Linux + Node + Source + Project dependencies
FROM node:16.13.2-alpine3.15 as base
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .

# Linux + Node + Source + Project dependencies + build assets
FROM base AS build
# ENV NODE_ENV=production
WORKDIR /build
COPY --from=base /app ./
RUN npm run build

# We keep some artifacts from build
FROM node:16.13.2-alpine3.15 AS production
# ENV NODE_ENV=production
WORKDIR /app
COPY --from=build /build/package*.json ./
COPY --from=build /build/.next ./.next
COPY --from=build /build/public ./public
COPY --from=build /build/node_modules ./node_modules
COPY --from=build /build/next.config.js ./
# RUN npm install next

EXPOSE 3000
CMD ["npm","run", "start"]




# FROM node:alpine3.11

# WORKDIR /app

# COPY package.json package-lock.json ./

# RUN npm install

# COPY . .

# RUN npm run build

# EXPOSE 3000

# CMD ["npm", "run", "start"]