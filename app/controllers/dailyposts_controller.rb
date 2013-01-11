class DailypostsController < ApplicationController
  # GET /dailyposts
  # GET /dailyposts.json
  def index
    @dailyposts = Dailypost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dailyposts }
    end
  end

  # GET /dailyposts/1
  # GET /dailyposts/1.json
  def show
    @dailypost = Dailypost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dailypost }
    end
  end

  # GET /dailyposts/new
  # GET /dailyposts/new.json
  def new
    @dailypost = Dailypost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dailypost }
    end
  end

  # GET /dailyposts/1/edit
  def edit
    @dailypost = Dailypost.find(params[:id])
  end

  # POST /dailyposts
  # POST /dailyposts.json
  def create
    @dailypost = Dailypost.new(params[:dailypost])

    respond_to do |format|
      if @dailypost.save
        format.html { redirect_to @dailypost, notice: 'Dailypost was successfully created.' }
        format.json { render json: @dailypost, status: :created, location: @dailypost }
      else
        format.html { render action: "new" }
        format.json { render json: @dailypost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dailyposts/1
  # PUT /dailyposts/1.json
  def update
    @dailypost = Dailypost.find(params[:id])

    respond_to do |format|
      if @dailypost.update_attributes(params[:dailypost])
        format.html { redirect_to @dailypost, notice: 'Dailypost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dailypost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dailyposts/1
  # DELETE /dailyposts/1.json
  def destroy
    @dailypost = Dailypost.find(params[:id])
    @dailypost.destroy

    respond_to do |format|
      format.html { redirect_to dailyposts_url }
      format.json { head :no_content }
    end
  end
end
