class DailynotesController < ApplicationController
  layout "main"
  # GET /dailynotes
  # GET /dailynotes.json
  def index
    @dailynotes = Dailynote.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dailynotes }
    end
  end

  # GET /dailynotes/1
  # GET /dailynotes/1.json
  def show
    @dailynote = Dailynote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dailynote }
    end
  end

  # GET /dailynotes/new
  # GET /dailynotes/new.json
  def new
    @dailynote = Dailynote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dailynote }
    end
  end

  # GET /dailynotes/1/edit
  def edit
    @dailynote = Dailynote.find(params[:id])
  end

  # POST /dailynotes
  # POST /dailynotes.json
  def create
    @dailynote = Dailynote.new(params[:dailynote])
    respond_to do |format|
      if @dailynote.save
        format.html { redirect_to @dailynote, notice: 'Dailynote was successfully created.' }
        format.json { render json: @dailynote, status: :created, location: @dailynote }
      else
        format.html { render action: "new" }
        format.json { render json: @dailynote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dailynotes/1
  # PUT /dailynotes/1.json
  def update
    @dailynote = Dailynote.find(params[:id])

    respond_to do |format|
      if @dailynote.update_attributes(params[:dailynote])
        format.html { redirect_to @dailynote, notice: 'Dailynote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dailynote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dailynotes/1
  # DELETE /dailynotes/1.json
  def destroy
    @dailynote = Dailynote.find(params[:id])
    @dailynote.destroy

    respond_to do |format|
      format.html { redirect_to dailynotes_url }
      format.json { head :no_content }
    end
  end
end
