# archlinuxjp slack bot

6:00 - 24:00 @herokubot

24:00 - 6:00 @herokubot2

## hubot

```bash
$ npm i -g hubot hubot-slack yo generator-hubot coffee-script
$ git clone https://github.com/archlinuxjp/slack-herokubot
$ cd slack-herokubot
$ ./bin/hubot
> @herokubot help
```

## script

```bash
$ pwd
/path/to/slack-herokubot
$ cat scripts/*.coffee

# add script
$ cat << EOF
module.exports = (robot) ->
  robot.respond /hello/i, (msg) ->
    msg.send 'world!'
EOF >> scripts/hello.coffee

# test
$ ./bin/hubot --slack
> @bot hello
> world
```

## build

[Wercker](https://app.wercker.com/syui)


```bash
# push
$ git add scripts/hello.coffee
$ git commit -m "add script"
$ git push -u origin master

## start -> wercker build!
## cat wercker.yml
```

## plugin

- [hubot-slack](https://github.com/slackhq/hubot-slack)

```bash
# add : credit card
$ heroku ps:scale web=1
$ heroku addons:add redistogo:nano
$ heroku config:set HUBOT_SLACK_TOKEN="xoxb-000000000-XXXXXXXXXXXXX"
$ npm i hubot-slack -S
```

- Process Scheduler

```bash
$ heroku addons:add process-scheduler
$ heroku addons:open process-scheduler
```

- [hubot-heroku-keepalive](https://github.com/hubot-scripts/hubot-heroku-keepalive)

```bash
$ npm i hubot-heroku-keepalive -S
$ vim ./external-scripts.json
[ "hubot-heroku-keepalive" ]

# https://devcenter.heroku.com/articles/scheduler
$ heroku config:add HUBOT_HEROKU_WAKEUP_TIME=8:00
$ heroku config:add HUBOT_HEROKU_SLEEP_TIME=24:00
$ heroku config:add TZ='Asia/Tokyo'
$ heroku config:set HUBOT_HEROKU_KEEPALIVE_URL=$(heroku apps:info -s | grep web_url | cut -d = -f 2)
$ heroku addons:create scheduler:standard
$ heroku addons:open scheduler
# curl ${HUBOT_HEROKU_KEEPALIVE_URL}heroku/keepalive
```

- [hubot-twitter-mention-v2](https://github.com/estiens/hubot-twitter-mention-v2)

```bash
$ npm i hubot-twitter-search -S
$ vim external-scripts.json
[ "hubot-twitter-search" ]

$ heroku config:add HUBOT_TWITTER_CONSUMER_KEY='Your–consumer-key-here'
$ heroku config:add HUBOT_TWITTER_CONSUMER_SECRET='Your-consumer-secret-here'
$ heroku config:add HUBOT_TWITTER_ACCESS_TOKEN_KEY='Your-access-token-here'
$ heroku config:add HUBOT_TWITTER_ACCESS_TOKEN_SECRET='Your-access-token-secret-here'
$ heroku config:add HUBOT_TWITTER_MENTION_QUERY='search-word'
$ heroku config:add HUBOT_TWITTER_MENTION_ROOM='general'
```

- [hubot-rss-reader](https://github.com/shokai/hubot-rss-reader)

```bash
$ npm i hubot-rss-reader -S
$ vim external-script.json
[ "hubot-rss-reader" ]
```

```bash
@herokubot: help
@herokubot: rss add https://www.archlinuxjp.org/feeds/news.xml
```

- [google-search](https://developers.google.com/custom-search/docs/overview)

```bash
$ heroku config:add HUBOT_GOOGLE_CSE_KEY=""
$ heroku config:add HUBOT_GOOGLE_CSE_ID=""
```

- [toshimaru/hubot-docomochatter](https://github.com/toshimaru/hubot-docomochatter)

```bash
$ npm i hubot-docomochatter -S
$ vim external-script.json
[ "hubot-docomochatter" ]
$ export DOCOMO_API_KEY=""
$ heroku config:add DOCOMO_API_KEY=""
```

- [gas-cronsheet-slack](https://github.com/motemen/gas-cronsheet-slack)


