class Item < ActiveRecord::Base
     belongs_to :user, foreign_key: "user_id"
     
     validates :title, presence: true
     validates :content, presence: true
end
