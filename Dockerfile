# The order in which we construct the container is optimized for Docker
# so that if mix packages or node libaries are not changes from build to 
# build, the host should be able to cache those layers to make builds faster.

FROM elixir:1.10.2 as builder

# Install rebar to create pure erlang releases and hex for fetching packages.
RUN mix local.rebar --force && \
    mix local.hex --force

# The app directory will be where we stage and build the Phoenix app. 
WORKDIR /app

# Setup the enviornment variables needed for the build.
ENV MIX_ENV=prod
ENV DATABASE_URL=${DATABASE_URL}
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}

# Copy the mix files from the host into the container
COPY mix.* /app/

# Fetch the production packages inside the container
RUN mix deps.get --only prod

# Compile the dependancies
RUN mix deps.compile

FROM node:13.12 as frontend

# Copy `assets` and all its subfolders from the host into the `frontend` container
COPY assets/ /app/assets/

# Copy the Phoenix deps from the mix build into the `frontend` container
# as they will be references by the webpack deploy script. 
COPY --from=builder /app/deps/phoenix /app/deps/phoenix
COPY --from=builder /app/deps/phoenix_html /app/deps/phoenix_html

WORKDIR /app
RUN npm install --prefix ./assets
RUN npm run deploy --prefix ./assets

FROM builder as releaser
ENV MIX_ENV=prod
COPY --from=frontend /app/priv/static /app/priv/static
COPY . /app/
RUN mix phx.digest
RUN mix release && \
    cd _build/prod/rel/coin_flip/ && \
    tar czf /opt/coin_flip.tar.gz .