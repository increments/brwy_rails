# BrwyRails

WIP: gem is not registered yet

## How to use

```
# at your project root
npm init
npm install --save-dev watchify browserify
```

config/application.rb
```ruby
config.assets.precompile = ["application.bundle.js", "application.css"]
# brwy_rails
config.brwy_rails.targets = [
  "app/assets/javascripts/application.js"
]
# config.brwy_rails.browserify_opts = "-t babelify" # your browserify compile command
# config.brwy_rails.verbose = true
# config.brwy_rails.target_suffix = ".bundle.js"
# config.brwy_rails.watch = Rails.env.development?
```

Inclede javascript with `.bundle`

```html
<%= javascript_include_tag 'application.bundle'%>
```

## LICENSE

MIT
