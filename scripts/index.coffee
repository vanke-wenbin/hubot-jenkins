jenkisConfig = require './config/jenkins'
jenkinsHelper = require './helper/jenkins'

module.exports = (hubot) ->

  hubot.hear /jenkins (.*) commit=([a-z0-9]*)/i, (res) ->
    jobName = res.match[1]
    commit = res.match[2]

    res.send "Building #{jobName} with param #{commit}"

    buildPromise = jenkinsHelper.build 'Forrest Gump'
    buildPromise.then (body) -> res.send body,
    (err) -> res.send err
    # res.send JSON.stringify jenkisConfig
