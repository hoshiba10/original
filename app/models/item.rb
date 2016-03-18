class Item < ActiveRecord::Base
     belongs_to :user, foreign_key: "user_id"
     
     mount_uploader :image, ImageUploader
     validates :title, presence: true
     validates :content, presence: true
     validates :image, presence: true
end
