class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index

	key = "a4bpRUI0lIAiFWHL"
	secret = "nmX8ry1OicN52o2tkgnX9GnAv0OS86o8"
	@client = Coinbase::Wallet::Client.new(api_key: key, api_secret: secret, api_url: "https://api.sandbox.coinbase.com")
	@price = @client.buy_price
	@amount = @price['amount']
	@accounts = @client.accounts
	@address = @accounts[0]

#@client.create_account(name: "moises")

	@accounts = Account.all
	@c_user = current_user
   
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show

key = "a4bpRUI0lIAiFWHL"
        secret = "nmX8ry1OicN52o2tkgnX9GnAv0OS86o8"
        @client = Coinbase::Wallet::Client.new(api_key: key, api_secret: secret, api_url: "https://api.sandbox.coinbase.com")

        @accts = @client.primary_account
        @test = @accts[0]

        @accts.send(to: params[:address], amount: params[:amount], currency: "BTC")
	redirect_to action: "index"


  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)


	key = "a4bpRUI0lIAiFWHL"
        secret = "nmX8ry1OicN52o2tkgnX9GnAv0OS86o8"
        @client = Coinbase::Wallet::Client.new(api_key: key, api_secret: secret, api_url: "https://api.sandbox.coinbase.com")

	@result = @client.create_account(name: @account.name)
	@app_id = @result['id']

	@result.create_address

	@account.account_id = @app_id
	@account.user_id = current_user.id

    respond_to do |format|
      if @account.save
        format.html { redirect_to action: "index", notice: 'Account was successfully created.' }
        format.json { redirect_to action: "index", status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :index, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    if(@account)
	@tid = @account.account_id
    end
    @account.destroy


     key = "a4bpRUI0lIAiFWHL"
     secret = "nmX8ry1OicN52o2tkgnX9GnAv0OS86o8"
     @client = Coinbase::Wallet::Client.new(api_key: key, api_secret: secret, api_url: "https://api.sandbox.coinbase.com")

    @find_acc = @client.account(@tid)
    @find_acc.delete!


    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
     # @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :account_id)
    end
end
