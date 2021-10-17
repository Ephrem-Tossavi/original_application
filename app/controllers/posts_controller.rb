class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  #before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    @posts = Post.all.order("created_at desc")
    @tags = Tag.where(user_id: nil).or(Tag.where(user_id: current_user.id))
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @tags = Tag.all
  end

  # GET /posts/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)
    #@post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    #@post = Post.new(post_params)
    render :new if @post.invalid?
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @tags = Tag.where(user_id: nil).or(Tag.where(user_id: current_user.id))
    session[:search] = {'name' => params[:search_title]}

    if params[:search_title].present?
      if params[:search_tag].present?
      @posts = Post.all.title_search(params[:search_title].tag_search(params[:search_tag]))
      else
      @posts = Post.all.title_search(params[:search_title])
      end 
      elsif params[:search_tag].present?
      @posts = Post.all.tag_search(params[:search_tag])
      #@posts = current_user.posts.tag_search(params[:search_tag])
      else
      @posts = Post.all
      end
    render :index
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :content, :attachment, :attachment_cache, tag_ids: [])
    end
end
