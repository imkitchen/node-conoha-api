global.nockback = require('nock').back
global.nockback.setMode process.env.NOCK_BACK_MODE || 'record'
global.nockback.fixtures = './tests/fixtures'

#filterCredentials
global.beforeFilter = (scope) ->

  scope.filteringRequestBody = (body, fixtureReqBody) ->
    fixtureReqBody = JSON.stringify fixtureReqBody
    foundValues = {}
    replaceList = [
      /(\"username\"):(\"gnc[a-z][0-9]+\")/g,
      /(\"password\"):(\"[a-zA-Z0-9_]+\")/g,
      /(\"tenantId\"):(\"[0-9a-f]+\")/g
    ]

    replaceList.forEach (reg) ->
      result = reg.exec(fixtureReqBody)
      foundValues[result[1]] = result[2]

    if Object.keys(foundValues).length != replaceList.length
      throw Error 'not found property to replace'

    replaceList.forEach (reg) ->
      body = body.replace reg, (match, key, value) ->
        "#{key}:#{foundValues[key]}"
    body
