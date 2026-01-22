# BUILD PHASE
FROM node:16-alpine AS builder
WORKDIR '/app'

COPY package.json .
RUN npm install

COPY ./ ./

RUN npm run build


# WE NEVER SAID ANYTHING TO END, FROM STATEMENT WE DO AGAIN, KIND OF TERMINATE PREVIOUS PHASE

# RUN phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# No specific command to start nginx, when we run nginx it runs nginx automatically.

# COPYING just the bare minimum step, from above and dumping everything else.