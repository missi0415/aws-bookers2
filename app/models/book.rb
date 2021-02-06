class Book < ApplicationRecord
  
  belongs_to :user
  # Userモデルに対してBookモデルがN:1　N側　
end
