class Shop < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    has_many :shop_tag_relations, dependent: :destroy
    has_many :tags, through: :shop_tag_relations, dependent: :destroy
end
