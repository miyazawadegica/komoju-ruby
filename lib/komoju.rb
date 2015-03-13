# encoding: utf-8

#
# WARNING: Do not edit by hand, this file was generated by Heroics:
#
#   https://github.com/interagent/heroics
#

require 'heroics'
require 'uri'

module Komoju
  # Get a Client configured to use HTTP Basic authentication.
  #
  # @param api_key [String] The API key to use when connecting.
  # @param options [Hash<Symbol,String>] Optionally, custom settings
  #   to use with the client.  Allowed options are `default_headers`,
  #   `cache`, `user` and `url`.
  # @return [Client] A client configured to use the API with HTTP Basic
  #   authentication.
  def self.connect(api_key, options=nil)
    options = custom_options(options)
    uri = URI.parse(options[:url])
    uri.user = options.fetch(:user, 'user').gsub('@', '%40')
    uri.password = api_key
    client = Heroics.client_from_schema(SCHEMA, uri.to_s, options)
    Client.new(client)
  end

  # Get a Client configured to use OAuth authentication.
  #
  # @param oauth_token [String] The OAuth token to use with the API.
  # @param options [Hash<Symbol,String>] Optionally, custom settings
  #   to use with the client.  Allowed options are `default_headers`,
  #   `cache` and `url`.
  # @return [Client] A client configured to use the API with OAuth
  #   authentication.
  def self.connect_oauth(oauth_token, options=nil)
    options = custom_options(options)
    url = options[:url]
    client = Heroics.oauth_client_from_schema(oauth_token, SCHEMA, url, options)
    Client.new(client)
  end

  # Get a Client configured to use Token authentication.
  #
  # @param token [String] The token to use with the API.
  # @param options [Hash<Symbol,String>] Optionally, custom settings
  #   to use with the client.  Allowed options are `default_headers`,
  #   `cache` and `url`.
  # @return [Client] A client configured to use the API with OAuth
  #   authentication.
  def self.connect_token(token, options=nil)
    options = custom_options(options)
    url = options[:url]
    client = Heroics.token_client_from_schema(token, SCHEMA, url, options)
    Client.new(client)
  end

  # Get customized options.
  def self.custom_options(options)
    return default_options if options.nil?

    final_options = default_options
    if options[:default_headers]
      final_options[:default_headers].merge!(options[:default_headers])
    end
    final_options[:cache] = options[:cache] if options[:cache]
    final_options[:url] = options[:url] if options[:url]
    final_options[:user] = options[:user] if options[:user]
    final_options
  end

  # Get the default options.
  def self.default_options
    default_headers = {}
    cache = {}
    {
      default_headers: default_headers,
      cache:           cache,
      url:             "https://api.komomju.com"
    }
  end

  private_class_method :default_options, :custom_options

  # Komoju's auto-generated JSON Schema
  class Client
    def initialize(client)
      @client = client
    end

    # Payment resource
    #
    # @return [Payments]
    def payments
      @payments_resource ||= Payments.new(@client)
    end

    # Subscription Resource
    #
    # @return [Subscriptions]
    def subscriptions
      @subscriptions_resource ||= Subscriptions.new(@client)
    end

    # Subscription Customers
    #
    # @return [Customers]
    def customers
      @customers_resource ||= Customers.new(@client)
    end

    # Subscription Plans
    #
    # @return [Plans]
    def plans
      @plans_resource ||= Plans.new(@client)
    end

    # Token resource
    #
    # @return [Tokens]
    def tokens
      @tokens_resource ||= Tokens.new(@client)
    end
  end

  private

  # Payment resource
  class Payments
    def initialize(client)
      @client = client
    end

    # Show a payment
    #
    # @param payments_id: A unique indentifier for the payment
    def show(payments_id)
      @client.payments.show(payments_id)
    end

    # Create a payment
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.payments.create(body)
    end
  end

  # Subscription Resource
  class Subscriptions
    def initialize(client)
      @client = client
    end

    # List subscriptions
    def list()
      @client.subscriptions.list()
    end

    # Show a subscription
    #
    # @param subscriptions_id: A unique identifier for a subscription.
    def show(subscriptions_id)
      @client.subscriptions.show(subscriptions_id)
    end

    # Create a subscription
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.subscriptions.create(body)
    end

    # Delete a subscription
    #
    # @param subscriptions_id: A unique identifier for a subscription.
    def delete(subscriptions_id)
      @client.subscriptions.delete(subscriptions_id)
    end
  end

  # Subscription Customers
  class Customers
    def initialize(client)
      @client = client
    end

    # List customers
    def list()
      @client.customers.list()
    end

    # Show a customer
    #
    # @param customers_id: A unique identifier for the customer.
    def show(customers_id)
      @client.customers.show(customers_id)
    end

    # Create a customer
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.customers.create(body)
    end

    # Delete a customer
    #
    # @param customers_id: A unique identifier for the customer.
    def delete(customers_id)
      @client.customers.delete(customers_id)
    end
  end

  # Subscription Plans
  class Plans
    def initialize(client)
      @client = client
    end

    # List plans
    def list()
      @client.plans.list()
    end

    # Show a plan
    #
    # @param plans_name: Name of the plan.
    def show(plans_name)
      @client.plans.show(plans_name)
    end

    # Create a plan
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.plans.create(body)
    end

    # Delete a plan
    #
    # @param plans_name: Name of the plan.
    def delete(plans_name)
      @client.plans.delete(plans_name)
    end
  end

  # Token resource
  class Tokens
    def initialize(client)
      @client = client
    end

    # Create a token
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.tokens.create(body)
    end
  end

  SCHEMA = Heroics::Schema.new(MultiJson.load(<<-'HEROICS_SCHEMA'))
{"$schema":"http://json-schema.org/draft-04/hyper-schema","definitions":{"payments":{"$schema":"http://json-schema.org/draft-04/hyper-schema","title":"Payments","description":"Payment resource","type":["object"],"definitions":{"given_name":{"type":["string"]},"family_name":{"type":["string"]},"given_name_kana":{"type":["string"]},"family_name_kana":{"type":["string"]},"email":{"type":["string"]},"phone":{"type":["string"],"pattern":"\\A([() \\-_+]*[0-9]){10}[() \\-_+0-9]*\\Z"},"instructions_url":{"type":["string"],"format":"uri"},"bank_transfer_request":{"type":["object"],"properties":{"type":{"enum":["bank_transfer"]},"email":{"$ref":"#/definitions/payments/definitions/email"},"given_name":{"$ref":"#/definitions/payments/definitions/given_name"},"family_name":{"$ref":"#/definitions/payments/definitions/family_name"},"given_name_kana":{"$ref":"#/definitions/payments/definitions/given_name_kana"},"family_name_kana":{"$ref":"#/definitions/payments/definitions/family_name_kana"}},"required":["type","given_name","family_name","given_name_kana","family_name_kana","email"]},"bank_transfer_response":{"type":["object"],"properties":{"type":{"enum":["bank_transfer"]},"order_id":{"type":["string"]},"bank_number":{"type":["integer"]}},"required":["type","order_id","bank_number"]},"konbini_request":{"type":["object"],"properties":{"type":{"enum":["konbini"]},"store":{"enum":["seven-eleven","lawson","family-mart","sunkus","circle-k","ministop","daily-yamazaki"]},"email":{"$ref":"#/definitions/payments/definitions/email"},"phone":{"$ref":"#/definitions/payments/definitions/phone"}},"required":["type","store","phone","email"]},"konbini_response":{"type":["object"],"properties":{"type":{"enum":["konbini"]},"store":{"enum":["seven-eleven","lawson","family-mart","sunkus","circle-k","ministop","daily-yamazaki"]},"instructions_url":{"$ref":"#/definitions/payments/definitions/instructions_url"},"confirmation_code":{"type":["string"]},"receipt":{"type":["string"]}},"required":["type","store","confirmation_code","receipt","instructions_url"]},"pay_easy_request":{"type":["object"],"properties":{"type":{"enum":["pay_easy"]},"email":{"$ref":"#/definitions/payments/definitions/email"},"given_name":{"$ref":"#/definitions/payments/definitions/given_name"},"family_name":{"$ref":"#/definitions/payments/definitions/family_name"},"given_name_kana":{"$ref":"#/definitions/payments/definitions/given_name_kana"},"family_name_kana":{"$ref":"#/definitions/payments/definitions/family_name_kana"},"instructions_url":{"$ref":"#/definitions/payments/definitions/instructions_url"}},"required":["type","given_name","family_name","given_name_kana","family_name_kana","email","phone"]},"pay_easy_response":{"type":["object"],"properties":{"type":{"enum":["pay_easy"]},"pay_url":{"type":["string"]}},"required":["type","pay_url","instructions_url"]},"web_money_request":{"type":["object"],"properties":{"type":{"enum":["web_money"]},"prepaid_number":{"type":["string"],"maxLength":16}},"required":["type","prepaid_number"]},"web_money_response":{"type":["object"],"properties":{"type":{"enum":["web_money"]},"retry_code":{"type":["string","null"]}},"required":["type","retry_code"]},"credit_card_request":{"type":["object"],"properties":{"type":{"enum":["credit_card"]},"number":{"type":["string"]},"month":{"type":["integer"]},"year":{"type":["integer"]},"verification_value":{"type":["string"]},"given_name":{"$ref":"#/definitions/payments/definitions/given_name"},"family_name":{"$ref":"#/definitions/payments/definitions/family_name"},"last_four_digits":{"type":["string"]},"brand":{"enum":["visa","american_express","master","jcb"]}},"required":["type","number","month","year","verification_value","given_name","family_name"]},"credit_card_response":{"type":["object"],"properties":{"type":{"enum":["credit_card"]},"month":{"type":["integer"]},"year":{"type":["integer"]},"last_four_digits":{"type":["string"]},"brand":{"enum":["visa","american_express","master","jcb"]}},"required":["type","brand","last_four_digits","month","year"]},"id":{"description":"A unique indentifier for the payment","example":"94f128d4021b049bc616f5b1b0","readOnly":true,"type":["string"]},"resource":{"description":"Value of `resource`.","example":"payment","enum":["payment"]},"amount":{"description":"The amount to be charged before tax. Must be equal or greater than 0. Use a ‘.’ as a decimal separator, and no thousands separator","example":"300","minimum":0,"type":["number"]},"external_order_num":{"description":"This is the merchant unique ID for the transaction. It will be included in all callbacks to identify the transaction.","example":"ORDER61","type":["string"]},"tax":{"description":"The amount of tax to be charged, or ‘auto’ to use the current consumption tax rate in Japan. Use a ‘.’ as a decimal separator, and no thousands separator. If the tax is more precise than the currency allows, it will be rounded using a round half up algorithm.","example":"30","type":["number","null"]},"payment_deadline":{"description":"Time when the payment will expire. This is a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ.","format":"date-time","example":"2015-03-09T06:52:34Z","type":["string","null"]},"payment_method_fee":{"description":"An additional fee added to specific payment types","example":"0","type":["number"],"minimum":0},"total":{"description":"The payment total, this is the amount + tax + payment_method_fee","example":"330","type":["number"]},"currency":{"description":"3 letter ISO currency code of the transaction","example":"JPY","enum":["JPY"]},"description":{"description":"Description of the payment (used in e-mail receipts if enabled).","example":"","type":["string","null"]},"subscription":{"description":"Shown if payment was part of a subscription","example":null,"type":["object","null"]},"succeeded":{"description":"A boolean which is true when a payment has been captured.","example":true,"type":["boolean"]},"payment_details_request":{"description":"A hash or token describing the payment method used to make the payment.","example":{"type":["konbini"],"store":"lawson","email":"foo@bar.com","phone":"08011111111"},"oneOf":[{"$ref":"#/definitions/payments/definitions/bank_transfer_request"},{"$ref":"#/definitions/payments/definitions/credit_card_request"},{"$ref":"#/definitions/payments/definitions/konbini_request"},{"$ref":"#/definitions/payments/definitions/pay_easy_request"},{"$ref":"#/definitions/payments/definitions/web_money_request"}]},"payment_details_response":{"description":"A hash or token describing the payment method used to make the payment.","example":{"type":["konbini"],"store":"lawson","confirmation_code":null,"receipt":"12345"},"oneOf":[{"$ref":"#/definitions/payments/definitions/bank_transfer_response"},{"$ref":"#/definitions/payments/definitions/credit_card_response"},{"$ref":"#/definitions/payments/definitions/konbini_response"},{"$ref":"#/definitions/payments/definitions/pay_easy_response"},{"$ref":"#/definitions/payments/definitions/web_money_response"}]},"created_at":{"description":"An ISO 8601 formatted timestamp of when a payment was created","example":"2015-03-06T06:52:35Z","format":"date-time","type":["string"]}},"links":[{"title":"Show","description":"Show a payment","href":"/payments/{(%2Fdefinitions%2Fpayments%2Fdefinitions%2Fid)}","method":"GET","rel":"self","targetSchema":{"$ref":"#/definitions"}},{"title":"Create","description":"Create a payment","href":"/payments","method":"POST","rel":"create","targetSchema":{"$ref":"#/definitions"},"schema":{"type":["object"],"properties":{"amount":{"$ref":"#/definitions/payments/definitions/amount"},"tax":{"$ref":"#/definitions/payments/definitions/tax"},"currency":{"$ref":"#/definitions/payments/definitions/currency"},"external_order_num":{"$ref":"#/definitions/payments/definitions/external_order_num"},"payment_details":{"$ref":"#/definitions/payments/definitions/payment_details_request"}},"required":["amount","currency","external_order_num","payment_details"],"additionalProperties":false}}],"properties":{"id":{"$ref":"#/definitions/payments/definitions/id"},"resource":{"$ref":"#/definitions/payments/definitions/resource"},"amount":{"$ref":"#/definitions/payments/definitions/amount"},"tax":{"$ref":"#/definitions/payments/definitions/tax"},"payment_deadline":{"$ref":"#/definitions/payments/definitions/payment_deadline"},"external_order_num":{"$ref":"#/definitions/payments/definitions/external_order_num"},"payment_details":{"$ref":"#/definitions/payments/definitions/payment_details_response"},"payment_method_fee":{"$ref":"#/definitions/payments/definitions/payment_method_fee"},"total":{"$ref":"#/definitions/payments/definitions/total"},"currency":{"$ref":"#/definitions/payments/definitions/currency"},"description":{"$ref":"#/definitions/payments/definitions/description"},"subscription":{"$ref":"#/definitions/payments/definitions/subscription"},"succeeded":{"$ref":"#/definitions/payments/definitions/succeeded"},"created_at":{"$ref":"#/definitions/payments/definitions/created_at"}}},"subscriptions":{"$schema":"http://json-schema.org/draft-04/hyper-schema","title":"Subscriptions","description":"Subscription Resource","type":["object"],"definitions":{"id":{"description":"A unique identifier for a subscription.","example":"66a4824ac97cc7afff608f27c7","readOnly":true,"type":["string"]},"resource":{"description":"Name of resource","example":"subscription","readOnly":true,"enum":["subscription"]},"status":{"description":"The status of the subscription.","example":"pending","readOnly":true,"enum":["cancelled","pending","active","past_due"]},"plan":{"$ref":"#/definitions/plans"},"customer":{"$ref":"#/definitions/customers"},"current_period_end_at":{"description":"An ISO 8601 formatted timestamp of when the subscription will next be billed.","example":null,"format":"date-time","readOnly":true,"type":["string","null"]},"created_at":{"description":"An ISO 8601 formatted timestamp of when the plan was created.","example":"2015-03-06T06:52:35Z","format":"date-time","readOnly":true,"type":["string"]}},"links":[{"title":"List","description":"List subscriptions","href":"/subscriptions","method":"GET","rel":"instances","targetSchema":{"items":{"$ref":"#/definitions"},"type":["array"]}},{"title":"Show","description":"Show a subscription","href":"/subscriptions/{(%2Fdefinitions%2Fsubscriptions%2Fdefinitions%2Fid)}","method":"GET","rel":"self","targetSchema":{"$ref":"#/definitions"}},{"title":"Create","description":"Create a subscription","href":"/subscriptions","method":"POST","rel":"create","targetSchema":{"$ref":"#/definitions"},"schema":{"type":["object"],"properties":{"customer":{"$ref":"#/definitions/customers"},"plan":{"$ref":"#/definitions/plans"}},"required":["customer","plan"]}},{"title":"Delete","description":"Delete a subscription","href":"/subscriptions/{(%2Fdefinitions%2Fsubscriptions%2Fdefinitions%2Fid)}","method":"DELETE","rel":"destroy","targetSchema":{"$ref":"#/definitions"}}],"properties":{"id":{"$ref":"#/definitions/subscriptions/definitions/id"},"resource":{"$ref":"#/definitions/subscriptions/definitions/resource"},"status":{"$ref":"#/definitions/subscriptions/definitions/status"},"plan":{"$ref":"#/definitions/subscriptions/definitions/plan"},"customer":{"$ref":"#/definitions/subscriptions/definitions/customer"},"current_period_end_at":{"$ref":"#/definitions/subscriptions/definitions/current_period_end_at"},"created_at":{"$ref":"#/definitions/subscriptions/definitions/created_at"}}},"customers":{"$schema":"http://json-schema.org/draft-04/hyper-schema","title":"Customers","description":"Subscription Customers","type":["object"],"definitions":{"id":{"description":"A unique identifier for the customer.","example":"fa799fca14be29d3fae455f22d","readOnly":true,"type":["string"]},"resource":{"description":"Name of resource","example":"customer","readOnly":true,"enum":["customer"]},"payment_details":{"$ref":"#/definitions/payments/definitions/payment_details_response"},"created_at":{"description":"An ISO 8601 formatted timestamp of when the customer was created.","example":"2015-03-06T06:52:35Z","format":"date-time","readOnly":true,"type":["string"]}},"links":[{"title":"List","description":"List customers","href":"/customers","method":"GET","rel":"instances","targetSchema":{"items":{"$ref":"#/definitions"},"type":["array"]}},{"title":"Show","description":"Show a customer","href":"/customers/{(%2Fdefinitions%2Fcustomers%2Fdefinitions%2Fid)}","method":"GET","rel":"self","targetSchema":{"$ref":"#/definitions"}},{"title":"Create","description":"Create a customer","href":"/customers","method":"POST","rel":"create","targetSchema":{"$ref":"#/definitions"},"schema":{"type":["object"],"properties":{"payment_details":{"$ref":"#/definitions/payments/definitions/payment_details_request"}},"required":["payment_details"],"additionalFields":false}},{"title":"Delete","description":"Delete a customer","href":"/customers/{(%2Fdefinitions%2Fcustomers%2Fdefinitions%2Fid)}","method":"DELETE","rel":"destroy","targetSchema":{"$ref":"#/definitions"}}],"properties":{"id":{"$ref":"#/definitions/customers/definitions/id"},"resource":{"$ref":"#/definitions/customers/definitions/resource"},"created_at":{"$ref":"#/definitions/customers/definitions/created_at"}}},"plans":{"$schema":"http://json-schema.org/draft-04/hyper-schema","title":"Plans","description":"Subscription Plans","type":["object"],"definitions":{"name":{"description":"Name of the plan.","example":"name2","type":["string"]},"resource":{"description":"Name of resource","example":"plan","enum":["plan"]},"interval":{"description":"The billing frequency of a subscription.","example":"month","enum":["day","week","month","year"]},"interval_count":{"description":"The number of intervals before the end of each billing period. For example, `interval=month` and `interval_count=3` would bill every 3 months.","example":"1","type":["integer"],"minimum":1},"amount":{"$ref":"#/definitions/payments/definitions/amount"},"tax":{"$ref":"#/definitions/payments/definitions/tax"},"currency":{"$ref":"#/definitions/payments/definitions/currency"},"created_at":{"description":"An ISO 8601 formatted timestamp of when the plan was created.","example":"2015-03-06T06:52:35Z","format":"date-time","readOnly":true,"type":["string"]}},"links":[{"title":"List","description":"List plans","href":"/plans","method":"GET","rel":"instances","targetSchema":{"items":{"$ref":"#/definitions"},"type":["array"]}},{"title":"Show","description":"Show a plan","href":"/plans/{(%2Fdefinitions%2Fplans%2Fdefinitions%2Fname)}","method":"GET","rel":"self","targetSchema":{"$ref":"#/definitions"}},{"title":"Create","description":"Create a plan","href":"/plans","method":"POST","rel":"create","targetSchema":{"$ref":"#/definitions"},"schema":{"type":["object"],"properties":{"name":{"$ref":"#/definitions/plans/definitions/name"},"interval":{"$ref":"#/definitions/plans/definitions/interval"},"interval_count":{"$ref":"#/definitions/plans/definitions/interval_count"},"amount":{"$ref":"#/definitions/plans/definitions/amount"},"tax":{"$ref":"#/definitions/plans/definitions/tax"},"currency":{"$ref":"#/definitions/plans/definitions/currency"}},"required":["name","interval","amount","currency"]}},{"title":"Delete","description":"Delete a plan","href":"/plans/{(%2Fdefinitions%2Fplans%2Fdefinitions%2Fname)}","method":"DELETE","rel":"destroy","targetSchema":{"$ref":"#/definitions"}}],"properties":{"resource":{"$ref":"#/definitions/plans/definitions/resource"},"name":{"$ref":"#/definitions/plans/definitions/name"},"interval":{"$ref":"#/definitions/plans/definitions/interval"},"interval_count":{"$ref":"#/definitions/plans/definitions/interval_count"},"currency":{"$ref":"#/definitions/plans/definitions/currency"},"amount":{"$ref":"#/definitions/plans/definitions/amount"},"tax":{"$ref":"#/definitions/plans/definitions/tax"},"created_at":{"$ref":"#/definitions/plans/definitions/created_at"}}},"tokens":{"$schema":"http://json-schema.org/draft-04/hyper-schema","title":"Tokens","description":"Token resource","type":["object"],"definitions":{"id":{"description":"A unique identifier for the token.","example":"tok_ed4119a0f69bc365286d5a9a8777f33cee024f19d532454e6abffccc42cf1452b6ad214de6b8e876cabc60ae6f","readOnly":true,"type":["string"]},"resource":{"description":"Name of resource","example":"token","enum":["token"]},"payment_details":{"$ref":"#/definitions/payments/definitions/payment_details_response"},"created_at":{"description":"An ISO 8601 formatted timestamp of when the token was created.","example":"2015-03-06T06:52:35Z","format":"date-time","type":["string"]}},"links":[{"title":"Create","description":"Create a token","href":"/tokens","method":"POST","rel":"create","targetSchema":{"$ref":"#/definitions"},"schema":{"type":["object"],"properties":{"payment_details":{"$ref":"#/definitions/payments/definitions/payment_details_request"}},"required":["payment_details"],"additionalFields":false}}],"properties":{"id":{"$ref":"#/definitions/tokens/definitions/id"},"resource":{"$ref":"#/definitions/tokens/definitions/resource"},"created_at":{"$ref":"#/definitions/tokens/definitions/created_at"}}}},"properties":{"payments":{"$ref":"#/definitions/payments"},"subscriptions":{"$ref":"#/definitions/subscriptions"},"customers":{"$ref":"#/definitions/customers"},"plans":{"$ref":"#/definitions/plans"},"tokens":{"$ref":"#/definitions/tokens"}},"type":["object"],"description":"Komoju's auto-generated JSON Schema","id":"komoju","links":[{"href":"https://api.komoju.com","rel":"self"}],"title":"Komoju API"}
HEROICS_SCHEMA
end
# encoding: utf-8
require 'komoju/version'
require 'komoju/client'
