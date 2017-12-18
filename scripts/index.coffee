jenkisConfig = require './config/jenkins'
jenkinsHelper = require './helper/jenkins'

module.exports = (hubot) ->

  hubot.hear /^jenkins (\S+)(\s+commit=(\w+))*/i, (res) ->
    jobName = res.match[1]
    commit = res.match[3]

    res.send "Building #{jobName} with param #{commit}"

    buildPromise = jenkinsHelper.build "#{jobName}"
    buildPromise.then (body) -> res.send body,
    (err) -> res.send err
    # res.send JSON.stringify jenkisConfig
