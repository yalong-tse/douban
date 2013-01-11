class PhotobooksController < ApplicationController
  # GET /photobooks
  # GET /photobooks.json
  def index
    @photobooks = Photobook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photobooks }
    end
  end

  # GET /photobooks/1
  # GET /photobooks/1.json
  def show
    @photobook = Photobook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photobook }
    end
  end

  # GET /photobooks/new
  # GET /photobooks/new.json
  def new
    @photobook = Photobook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photobook }
    end
  end

  # GET /photobooks/1/edit
  def edit
    @photobook = Photobook.find(params[:id])
  end

  # POST /photobooks
  # POST /photobooks.json
  def create
    @photobook = Photobook.new(params[:photobook])

    respond_to do |format|
      if @photobook.save
        format.html { redirect_to @photobook, notice: 'Photobook was successfully created.' }
        format.json { render json: @photobook, status: :created, location: @photobook }
      else
        format.html { render action: "new" }
        format.json { render json: @photobook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photobooks/1
  # PUT /photobooks/1.json
  def update
    @photobook = Photobook.find(params[:id])

    respond_to do |format|
      if @photobook.update_attributes(params[:photobook])
        format.html { redirect_to @photobook, notice: 'Photobook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photobook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photobooks/1
  # DELETE /photobooks/1.json
  def destroy
    @photobook = Photobook.find(params[:id])
    @photobook.destroy

    respond_to do |format|
      format.html { redirect_to photobooks_url }
      format.json { head :no_content }
    end
  end
end
