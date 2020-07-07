FROM hayd/deno:alpine-1.1.3

EXPOSE 30000

WORKDIR /app

USER deno

COPY deps.ts .
RUN deno cache deps.ts

COPY . .
# RUN deno cache main.ts

CMD ["run", "--allow-net", "--allow-read", "--allow-env", "main.ts"]
