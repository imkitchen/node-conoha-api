describe 'AccountService class', ->

  describe 'request', ->
    it 'GET /'

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
