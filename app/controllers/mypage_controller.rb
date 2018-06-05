class MypageController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @follow = Follow.all.order('created_at desc')
    @posts = Post.all.order('created_at desc')
    @posts_count = current_user.posts.length
  end
  
end