Helper = require('hubot-test-helper')
expect = require('chai').expect
nock = require('nock')

# helper loads a specific script if it's a file
helper = new Helper('./../src/cesare.coffee')

describe 'cesare', ->
  room = null

  beforeEach ->
    # Set up the room before running the test
    room = helper.createRoom()
    do nock.disableNetConnect
    nock('https://graph.facebook.com')
      .get('/v2.6/199125480124588/feed?access_token=SET_APP_ACCESS_TOKEN_AS_ENVIRONMENT_VARIABLE')
      .reply 200, '{
  "data": [
    {
      "message": "Menu Today",
      "created_time": "2016-05-20T07:29:10+0000",
      "id": "199125480124588_1021003141270147"
    },
    {
      "message": "Menu Yesterday",
      "created_time": "2016-05-19T07:28:15+0000",
      "id": "199125480124588_1021002874603507"
    }
]}'

  afterEach ->
    # Tear it down after the test to free up the listener.
    room.destroy()
    nock.cleanAll()

  context 'user says cesare to hubot', ->
    beforeEach (done) ->
      room.user.say 'alice', 'hubot cesare'
      setTimeout done, 200

    it 'should reply with menu to user', ->
      expect(room.messages).to.eql [
        ['alice', 'hubot cesare']
        ['hubot', '20.05. - Menu Today']
      ]