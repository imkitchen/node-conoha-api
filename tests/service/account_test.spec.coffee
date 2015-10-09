ConoHa = require '../../src/conoha'

describe 'AccountService class', ->

  conoha = s = null

  before (done) ->
    conoha = new ConoHa process.env.CONOHA_IDENTITY_URL,
      auth:
        passwordCredentials:
          username: process.env.CONOHA_USERNAME
          password: process.env.CONOHA_PASSWORD
        tenantId: process.env.CONOHA_TENANT_ID
    id = conoha.getService 'identity'
    s = conoha.getService 'account'
    id.postTokens (err, token) ->
      console.log token
      done()



  describe 'request', ->
    it 'GET /', (done) ->
      nockback 'account_get_version_list.json', (nockdone) ->
        s.getVersionList (err, versions) ->
          expect(versions[0]).to.have.property 'status'
          nockdone()
          done()

    it 'GET /v1'

    it 'GET /v1/{tenant_id}/order-items'

    it 'GET /v1/{tenant_id}/order-items/{item_id}'

    it 'GET /v1/{tenant_id}/product-items'

    it 'GET /v1/{tenant_id}/payment-history'

    it 'GET /v1/{tenant_id}/payment-summary'

    it 'GET /v1/{tenant_id}/billing-invoices'

    it 'GET /v1/{tenant_id}/billing-invoices/{invoice_id}'

    it 'GET /v1/{tenant_id}/notifications'

    it 'GET /v1/{tenant_id}/notifications/{notification_code}'

    #NOTE: need write permission (how to test?)
    #it 'PUT /v1/{tenant_id}/notifications/{notification_code}'

    it 'GET /v1/{tenant_id}/object-storage/rrd/request'

    it 'GET /v1/{tenant_id}/object-storage/rrd/size'
