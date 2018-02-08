class SecretCodesController < ApplicationController
  before_action :set_secret_code, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /secret_codes
  # GET /secret_codes.json
  def index
    @secret_codes = SecretCode.all
  end

  # GET /secret_codes/1
  # GET /secret_codes/1.json
  def show
  end

  # GET /secret_codes/new
  def new
    @secret_code = SecretCode.new.decorate
  end

  # GET /secret_codes/1/edit
  def edit
  end

  # POST /secret_codes
  # POST /secret_codes.json
  def create
    respond_to do |format|
      begin
        @quantity = params[:secret_code] ? params[:secret_code][:quantity].to_i : 10
        @secret_code =SecretCode.create!(_set_secret_code_params) 
        format.html { redirect_to secret_codes_url, notice: 'Secret codes was successfully created.' }
      rescue Exception => e
        puts e
        format.html { redirect_to new_secret_codes_url, error: e }
      end
    end
  end

  # PATCH/PUT /secret_codes/1
  # PATCH/PUT /secret_codes/1.json
  def update
    respond_to do |format|
      if @secret_code.update(secret_code_params)
        format.html { redirect_to @secret_code, notice: 'Secret code was successfully updated.' }
        format.json { render :show, status: :ok, location: @secret_code }
      else
        format.html { render :edit }
        format.json { render json: @secret_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secret_codes/1
  # DELETE /secret_codes/1.json
  def destroy
    @secret_code.destroy
    respond_to do |format|
      format.html { redirect_to secret_codes_url, notice: 'Secret code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secret_code
      @secret_code = SecretCode.where(id: params[:id]).first.decorate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secret_code_params
      params.require(:secret_code).permit(:user_id, :code)
    end
    def _set_secret_code_params
      return (1..@quantity).to_a.collect{|quant| {code: nil, email: params[:secret_code][:email]}}
    end
end
