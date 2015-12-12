require 'coinbase/wallet'

class HomeController < ApplicationController

def index
key = "oHQ2zQEHJkms7HYV"
secret = "mvmhft7dI5m7rL0X2etTLb2mDnuVhX6M"
@client = Coinbase::Wallet::Client.new(api_key: key, api_secret: secret, api_url: "https://api.sandbox.coinbase.com")
@price = @client.buy_price
@amount = @price['amount']


end

end
