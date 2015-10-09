module.exports = class AccountService
  constructor: (@conoha) ->
    @endpoint = 'https://account.tyo1.conoha.io'

  # https://www.conoha.jp/docs/account-get_version_list.html
  getVersionList: (callback) ->
    @conoha.request.get
      url: @endpoint+'/'
      headers: { 'Accept': 'application/json' }
      (err, res, body) ->
        versions = JSON.parse(body).versions
        callback(err, versions)

  # https://www.conoha.jp/docs/account-get_version_detail.html
  getVersionDetail: (callback) ->
    @conoha.request.get
      url: @endpoint+'/v1'
      headers: { 'Accept': 'application/json' }
      (err, res, body) ->
        version = JSON.parse(body).version
        callback(err, version)

  # https://www.conoha.jp/docs/account-order-item-list.html
  # https://www.conoha.jp/docs/account-order-item-detail-specified.html
  #orderItemList: (callback) ->

  # https://www.conoha.jp/docs/account-products.html
  getVersionDetail: (callback) ->
    @conoha.request.get
      url: @endpoint+'/v1/product'
      headers: { 'Accept': 'application/json' }
      (err, res, body) ->
        version = JSON.parse(body)
        callback(err, version)

  # https://www.conoha.jp/docs/account-payment-histories.html

  # https://www.conoha.jp/docs/account-payment-summary.html

  # https://www.conoha.jp/docs/account-billing-invoices-list.html
  # https://www.conoha.jp/docs/account-billing-invoices-detail-specified.html

  # https://www.conoha.jp/docs/account-informations-list.html
  # https://www.conoha.jp/docs/account-informations-detail-specified.html

  # https://www.conoha.jp/docs/account-informations-marking.html

  # https://www.conoha.jp/docs/account-get_objectstorage_request_rrd.html

  # https://www.conoha.jp/docs/account-get_objectstorage_size_rrd.html
