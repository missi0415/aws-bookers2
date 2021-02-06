class Book < ApplicationRecord
  
  belongs_to :user
  # Userモデルに対してBookモデルがN:1　N側　
   validates :title, presence: true
   validates :body, presence: true, length: { maximum: 200 }
   
end
