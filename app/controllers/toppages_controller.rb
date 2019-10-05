class ToppagesController < ApplicationController
  
  def index
    @posts = Post.order('updated_at DESC').page(params[:page])
  end
end
