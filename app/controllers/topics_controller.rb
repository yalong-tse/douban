#encoding: utf-8
class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json
  def index
    @group_id = params[:group_id]
    logger.info "the group id is : #{@group_id}"
    if @group_id 
      @topics = Topic.where(:group_id => params[:group_id])
    else
      @topics = Topic.all
    end
    #logger.info "the topics has #{@topics}"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # 根据group_id 获得改组下的所有话题
  def group
    @topics = Topic.find_by_group_id(params[:group_id])
	respond_to do |format|
	  format.html  # grouptopic.html.erb
	  format.json {render json: @topics}
	end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @group_id = params[:group_id]
    @topic = Topic.new
    unless @group_id.nil?
      @topic.group_id = @group_id
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end
end
