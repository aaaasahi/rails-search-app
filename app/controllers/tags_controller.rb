class TagsController < ApplicationController
  def index
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.order(created_at: :desc).all
  end
end