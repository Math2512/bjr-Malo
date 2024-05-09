class PostsController < ApplicationController
  def index

    posts = Post.search(params[:query])
    @pagy, @posts = pagy_countless(posts, items: 5)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
    
  end

  def show
  end

  def create
  end

  def self_search
  end
end
