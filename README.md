# Hubot: hubot-cesare

A De Cesare Itzling Menu service for Hubots (https://www.facebook.com/De-Cesare-Itzling-199125480124588/).

[![Build Status](https://travis-ci.org/tholu/hubot-cesare.png?branch=master)](https://travis-ci.org/tholu/hubot-cesare)

See [`src/cesare.coffee`](src/cesare.coffee) for full documentation.

## Installation

Add **hubot-cesare** to your `package.json` file:

```json
"dependencies": {
  "hubot": ">= 2.5.1",
  "hubot-scripts": ">= 2.4.2",
  "hubot-cesare": ">= 0.0.0"
}
```

Run `npm install hubot-cesare`

Add **hubot-cesare** to your `external-scripts.json`:

```json
["hubot-cesare"]
```

For the bot to work properly, you need an Facebook app access token to get the latest Facebook post from the De Cesare Facebook page.
The app access token is `<App ID>|<App Secret>`. 
Set it as an environment variable `HUBOT_FACEBOOK_APP_ACCESS_TOKEN` to let `hubot-cesare` use it.

## Sample Interaction

```
user1>> hubot cesare
hubot>> 20.05. - Menu Today
```
