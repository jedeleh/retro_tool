# RetroTool

To start your Phoenix server:

  * Create config/dev.exs and paste contents of config/dev.example.exs into that
  * Change username near the bottom of config/dev.exs to your own
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## CI

  * Using Travis:  https://travis-ci.com/jedeleh/retro_tool
  * requires a valid .travis.yml in the root directory (checked in already)
  * This will execute tests on Travis upon creation or update of a PR
