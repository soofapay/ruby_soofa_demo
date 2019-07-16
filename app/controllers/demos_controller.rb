require 'soofapay'
require 'json'
class DemosController < ApplicationController
  before_action :set_demo, only: []

  # POST /demos
  # POST /demos.json
  TILL_NO = 5002
  CLIENT_SECRET = "3ixwt45uq88wttqgixpyla8d27ob0w"

  def create
    tid = params["tid"]
    soofa = Soofa.new(TILL_NO, CLIENT_SECRET)
    exist = soofa.find(tid)
    if exist
      trx = soofa.get_transaction
      puts trx.tid, trx.reference, trx.gross_amount, trx.as_json
      @demo = Demo.new(data:trx.as_json)
    end
    respond_to do |format|
      if @demo.save
        format.html {redirect_to '/', notice: 'Successfully created , Your transaction reference is %s' % trx.tid}
        format.json {render :show, status: :created, location: @demo}
      else
        format.json {render json: @demo.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_demo
    @demo = Demo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def demo_params
    params.permit(:data)
  end
end
