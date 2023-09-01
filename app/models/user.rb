class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :icon_image, ImageUploader

  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name,                  presence: true
  validates :email,                 presence: true, uniqueness: true
  validates :password,              confirmation: true
  validates :password_confirmation, presence: true

end
