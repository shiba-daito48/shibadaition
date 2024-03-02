class Like < ApplicationRecord
  belongs_to :shiba
  belongs_to :user
  validates_uniqueness_of :shiba_id, scope: :user_id
end
