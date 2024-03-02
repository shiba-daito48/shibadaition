class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :likes, dependent: :destroy
  has_many :liked_shibas, through: :likes, source: :shiba

  def already_liked?(shiba)
    self.likes.exists?(shiba_id: shiba.id)
  end

  has_many :shibas, dependent: :destroy
  has_many :comments, dependent: :destroy
end
