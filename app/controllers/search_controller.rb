class SearchController < ApplicationController
  def index
    if params[:query].start_with?('#')
      query  = params[:query].gsub('#', '')
      @posts = Post.joins(:tags).where(tags: {name: query})
    else
      @posts = Post.joins(:tags).where(tags: {name: "%#{params[:query]}%"})
    end
  end
end
