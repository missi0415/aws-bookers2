class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :s, dependent: :destroy
  # Userモデルに対して、Bookモデルが1:N
  attachment :profile_image
  
end
