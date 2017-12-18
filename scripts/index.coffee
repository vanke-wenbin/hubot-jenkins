jenkisConfig = require './config/jenkins'
jenkinsHelper = require './helper/jenkins'

module.exports = (hubot) ->
  hubot.hear /jenkins (\S+)(\s+commit=(\w+))*$/i, (res) ->
    jobName = res.match[1]
    commit = res.match[3]

    if commit
      res.send "Building #{jobName} with param #{commit}"
    else
      res.send "Building #{jobName} without params"

    buildPromise = jenkinsHelper.build "#{jobName}"
    buildPromise.then (body) -> res.send body,
    (err) -> res.send err
    # res.send JSON.stringify jenkisConfig
