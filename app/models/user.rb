class User < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    mount_uploader :image, ImageUploader
    
    has_many :favorites, :dependent => :destroy
    has_many :favorited_items, :through => :favorites, :source => :item
    
    has_many :items, dependent: :destroy
    
    def favorite_item(item)
        favorites.find_or_create_by(:item_id => item.id)        
    end
    
    def unfavorite_item(item)
        @item = favorites.find_by(:item_id => item.item_id)
        @item.destroy if @item
    end
    
    def favouriting?(item)
        favorited_items.include?(item)
    end
end
