request = require 'request'

jenkinsConfig = require '../config/jenkins'

module.exports =

  build: (jobName) ->
    new Promise (resolve, reject) ->
      request.post "http://#{jenkinsConfig.user}:#{jenkinsConfig.password}@#{jenkinsConfig.url}/job/#{jobName}/build",
      (err, httpResponse, body) ->
        if err
          reject err
        else
          resolve body
