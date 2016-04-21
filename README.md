# BrwyRails

Spawn `watchify` to compile js or compile js with `browserify` under backgroud by env.

```
gem 'brwy_rails'
```

## What's this?

Under development, spawn `watchify` process and compile js with it. Under production, compile js once with browserify.

My motivation is `browserify_rails` is too slow.

## How to use

```sh
# at your project root
npm init
npm install --save-dev watchify browserify

# or brwy_rails:npm_setup

bundle exec rake brwy_rails:npm_setup # create package.json and add watchify
```

Add `config.brwy_rails.targets` and access it by `{name}.bundle.js`

```ruby
# config/application.rb
config.assets.precompile = ["application.bundle.js", "application.css"]
# brwy_rails
config.brwy_rails.targets = [
  "app/assets/javascripts/application.js"
]
Rails.application.config.middleware.use BrwyRails.Middleware
# config.brwy_rails.browserify_opts = "-t babelify" # your browserify compile command
# config.brwy_rails.verbose = true
# config.brwy_rails.target_suffix = ".bundle"
# config.brwy_rails.watch = Rails.env.development?
# config.brwy_rails.poll = false
# config.brwy_rails.polling_interval = 1000
```

Include javascript with `.bundle` suffix (configure it as `config.brwy_rails.target_suffix`)

```html
<%= javascript_include_tag 'application.bundle'%>
```

## On development

If you want to wait watchify compiling, use `BrwyRails.Middleware`.

```ruby
# config/environments/development.rb
Rails.application.config.middleware.use BrwyRails.Middleware
```

## CAUTION

On production build, we have to do `rake brwy_rails:build` manually before `rake assets:precompile`.

It will be called naturally with `assets:precompile` later.

## LICENSE

MIT
