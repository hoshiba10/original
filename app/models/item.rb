class Item < ActiveRecord::Base
     belongs_to :user, foreign_key: "user_id"
     validates :user_id, presence: true
     mount_uploader :image, ImageUploader
     validates :title, presence: true
     validates :content, presence: true
     validates :image, presence: true
     
     has_many :favorite, :dependent => :destroy
     has_many :favorited_users, :through => :favorite, :source => :user
end
