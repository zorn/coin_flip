# Coin Flip

This project is a WIP demo of a Docker Compose example that containerizes an typical Elixir Phoenix project.

To produce the release binary run:

> $ docker-compose up

To clean docker:

> $ docker container rm -f (docker container ls -aq)
> $ docker image rm -f (docker image ls -aq)
> $ docker network prune --force
> $ docker volume prune --force

## Related Documentations

* [mix release, assembles a self-contained release for the current project](https://hexdocs.pm/mix/Mix.Tasks.Release.html)
* [Phoenix: Introduction to Deployment](https://hexdocs.pm/phoenix/deployment.html)

## Phoenix README

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server` or `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
