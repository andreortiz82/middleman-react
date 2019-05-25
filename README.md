# Middleman + React + Heroku (2019)

This project runs React via Middleman's External Pipeline and will deploy to Heroku.

1. `bundle install`
2. `npm install`
3. `middleman server`
4. `heroku create`
5. `heroku buildpacks:set heroku/ruby`
6. `heroku buildpacks:add heroku/nodejs --index 1`
7. `git push heroku master`
