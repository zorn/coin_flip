FROM elixir:1.10.2 as builder
RUN mix local.rebar --force && \
    mix local.hex --force
WORKDIR /app
ENV MIX_ENV=prod
COPY mix.* /app/
RUN mix deps.get --only prod
RUN mix deps.compile

FROM node:13.12 as frontend
WORKDIR /app
COPY app/assets/package.json assets/package-lock.json /app/
COPY --from=builder /app/deps/phoenix /deps/phoenix
COPY --from=builder /app/deps/phoenix_html /deps/phoenix_html
RUN npm install -g yarn && yarn install
COPY assets /app
RUN yarn run deploy
