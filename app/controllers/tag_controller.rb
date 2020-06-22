class TagController < ApplicationController
  def index
    @follow = Follow.all.order('created_at desc')
    @posts = Post.all.order('created_at desc')
    @posts_count = current_user.posts.length
  end
  
  def show 
    @shows=Post.order('created_at desc') 
    if user_signed_in? 
     redirect_to posts_path 
    end 
  end
  
end
