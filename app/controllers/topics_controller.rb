#encoding: utf-8
class TopicsController < ApplicationController
  layout "main"
  # GET /topics
  # GET /topics.json
  def index
    @group_id = params[:group_id]
    logger.info "the group id is : #{@group_id}"
    if @group_id 
      @topics = Topic.where(:group_id => params[:group_id])
      @group = Group.find(@group_id)
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
      @group = Group.find(@group_id)
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
    @group = @topic.group
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])
    @topic.user_id = session[:user_id]
    @group_id = params[:group_id]
    if @group_id
      @group = Group.find(@group_id)
    end
    logger.info ("the image is #{params[:topic][:image]}")
    rename = @topic.save_image(params[:topic][:image])
    @topic.image = rename
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
    @topic.user_id = session[:user_id]
    @group_id = params[:topic][:group_id]
    if @group_id
      @group = Group.find(@group_id)
    end
    logger.info ("the image is #{params[:topic][:image]}")
    if params[:topic][:image]
      rename = @topic.save_image(params[:topic][:image])
    else
      rename = @topic.image
    end
    respond_to do |format|
      if @topic.update_attributes(:image=>rename,:group_id=>@group_id,:user_id=>session[:user_id],:title=>params[:topic][:title],
                                 :description=>params[:topic][:description])
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
    #logger.info "=========================#{@topic}"
    @group_id = @topic.group_id || 1
    #logger.info "===========================#{@group_id}"
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to group_topics_path(@group_id) }
      format.json { head :no_content }
    end
  end
end
