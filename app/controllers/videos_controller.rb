class VideosController < ApplicationController
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all(order: 'views desc')
    @video = Video.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])

    if request.xhr?
      @video.views ||= 1
      @video.views += 1
      @video.save!
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
      format.js   { render 'youtube', layout: false }
    end
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new

    @gm_id = params[:gm_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
      format.js
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(params[:video])

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render json: @video, status: :created, location: @video }
        format.js   { render :nothing }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
        format.js   { render :nothing }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :ok }
    end
  end
end
