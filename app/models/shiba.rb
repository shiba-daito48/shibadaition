class Shiba < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :comments, dependent: :destroy

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
end
