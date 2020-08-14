class PostsController < ApplicationController
  before_action :authorize_request
  before_action :set_post, only: [:update, :destroy]

  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end

  def create
    @post = @current_user.posts.create(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    return render json: {errors: "You don't have access to update this post"},
      status: 400 unless @post.user_is_author?(@current_user.id)
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return render json: {errors: "You don't have access to delete this post"},
      status: 400 unless @post.user_is_author?(@current_user.id)
    @post.destroy
    render json: {errors: "Deleted!"}, status: :ok
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, tag_list: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
