## StreetsCouldTalk Prototype

Built from Carbon Five-flavored convenience skeleton project for Phoenix.

* [Phoenix](https://hex.pm/packages/phoenix)
* [Postgrex](https://hex.pm/packages/postgrex)
* [Slim](https://hex.pm/packages/slime)
* [Wallaby](https://hex.pm/packages/wallaby)
* [ExMachina](https://hex.pm/packages/ex_machina)
* Yarn
* Sass
* Bootstrap
* additional `acceptance` environment
* CI testing via CircleCI
* .iex.exs for REPL aliases & imports
* ready for deployment to Heroku Pipelines in `acceptance` and `prod` environments.

#### Give it a spin:

* `mix deps.get`
* `mix ecto.setup`
* `cd assets && yarn install`
* `cd assets && brunch build`
* `mix test`
* Run with `heroku local`
* visit the app in a browser (default is `http://localhost:4000`, or `http://127.0.0.1:4000` in some versions of Chrome)

Now you're ready to remove demo content, which is easy to spot from the landing page.

## Requirements

* phantomjs is required for acceptance testing with Wallaby, i.e. `yarn global add phantomjs`.
  [Lean more about wallaby](https://github.com/keathley/wallaby)

## Recommendations

* If you use [asdf](https://github.com/asdf-vm/asdf), you'll be set up with the correct versions of `node` and `elixir` once they're installed. Otherwise, have a look at `.tool-versions` to see the current versions.

## Deployment

This app is pre-configured for easy deployment to Heroku w/ pipelines using CircleCI. CI is only used to run tests; your pipelines should be configured to auto-deploy branches after passing CI tests.

Convention is to auto-deploy `master` branch to `acceptance`, and `production` branch to `production`.

* Create Heroku apps for `acceptance` and `production`
* Provision Heroku Postgres DB resources
* Add buildpacks to Heroku apps
  * `heroku buildpacks:add https://github.com/HashNuke/heroku-buildpack-elixir.git --app your-heroku-app-name`
  * `heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git --app your-heroku-app-name`
* Add environment variables to Heroku
  * `SECRET_KEY_BASE`, which can be generated with the task `mix phx.gen.secret`
  * `HOSTNAME`, should be the hostname of the deployed site (e.g. `streetscouldtalk-production.herokuapp.com`)
  * `MIX_ENV` should be `prod`
  * `POOL_SIZE` should be set 2 units below the max db connections allowed by the Heroku instance. This allows mix tasks to be run with 2 connections.
  * `DATABASE_URL` should have been filled automatically by provisioning heroku postgres.
* Migrations are run automatically using Heroku's [release phase](https://devcenter.heroku.com/articles/release-phase).
* Configure Elixir, Erlang and Node versions via the `elixir_buildpack.config` and `phoenix_static_buildpack.config` files. See the corresponding buildpack project pages for more configuration variables.
