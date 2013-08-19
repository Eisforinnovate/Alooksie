class BetaController < ApplicationController

  # GET /beta/new
  # GET /beta/new.json
  def new

    @betum = Betum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @betum }
    end
  end

  # POST /beta
  # POST /beta.json
  def create
    @betum = Betum.new(params[:betum])

    respond_to do |format|
      if @betum.save
        format.html { redirect_to :back, notice: 'You have been successfully registered!' }
        format.json { render json: @betum, status: :created, location: @betum }
      else
        format.html { render action: "new" }
        format.json { render json: @betum.errors, status: :unprocessable_entity }
      end
    end
  end

end
