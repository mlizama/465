require 'coinbase/wallet'

class HomeController < ApplicationController

def index
key = "a4bpRUI0lIAiFWHL"
secret = "nmX8ry1OicN52o2tkgnX9GnAv0OS86o8"
@client = Coinbase::Wallet::Client.new(api_key: key, api_secret: secret, api_url: "https://api.sandbox.coinbase.com")
@price = @client.buy_price
@amount = @price['amount']
@accounts = @client.accounts
@address = @accounts[2]

@client.create_account(name: "moises")
end

end
