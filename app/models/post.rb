class Post < ApplicationRecord
    # carrierwave (image uploader)
    mount_uploader :image, PostImageUploader
    
    belongs_to :user
    has_and_belongs_to_many :tags
    has_many :comments
    has_many :likes
    # 1:N 관계인 likes를 이용해서 User와 N:N 관계를 구현
    # 특정 글에 좋아요를 누른 users를 얻을 수 있음.
    # ex) post.liked_users
    has_many :liked_users, through: :likes, source: :user

end
