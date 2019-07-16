require "soofapay"
class SoofaDemoController < ApplicationController
  before_action :set_soofa_demo, only: [:create]
  # POST /users
  # POST /users.json
  def create
    @user = Demo.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end



