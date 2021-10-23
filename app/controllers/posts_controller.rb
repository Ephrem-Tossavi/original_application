class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:index, :new, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @posts = Post.all.order("created_at desc")
    @tags = Tag.where(user_id: nil) || (Tag.where(user_id: current_user.id))
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def edit
    @tags = Tag.all
  end

  def create
    @tags = Tag.all
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

  #def confirm
  #  @tags = Tag.all
  #  @post = current_user.posts.build(post_params)
  #  render :new if @post.invalid?
  #end

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

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :content, :attachment, :attachment_cache, tag_ids: [])
    end
end
