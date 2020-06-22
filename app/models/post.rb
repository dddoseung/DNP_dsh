class Post < ApplicationRecord
    # carrierwave (image uploader)
    mount_uploader :image, PostImageUploader

    
    belongs_to :user
    #has_and_belongs_to_many :tags
    has_many :comments
    #has_many :likes
    ##has_many :dislikes
    # 1:N 관계인 likes를 이용해서 User와 N:N 관계를 구현
    # 특정 글에 좋아요를 누른 users를 얻을 수 있음.
    # ex) post.liked_users
    #has_many :liked_users, through: :likes, source: :user
    #has_many :disliked_users, through: :dislikes, source: :user
    
    after_create do
        post = Post.find_by(id: self.id)
		'''
        hashtags = self.content.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(name: hashtag.downcase.delete("#"))
            post.tags << tag
        end
		'''
    end
    
    before_update do
        post = Post.find_by(id: self.id)
		'''
        post.tags.clear
        hashtags = self.content.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(name: hashtag.downcase.delete("#"))
            post.tags << tag
        end
		'''
    end
end
