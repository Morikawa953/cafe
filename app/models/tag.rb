class Tag < ApplicationRecord
    validates :name, presence: true
    has_many :shop_tag_relations, dependent: :destroy
    has_many :shops, through: :shop_tag_relations, dependent: :destroy
end
