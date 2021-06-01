class PostsController < ApplicationController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def search 
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true)
  end


  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:name,:text, :prefecture_id, :category_id)
  end

  def search_params
    params.require(:q).permit(:name_cont, :prefecture_id_eq,:category_id_eq)
  end
end