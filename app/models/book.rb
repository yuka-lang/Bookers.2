class Book < ApplicationRecord
  attachment :image
   belongs_to :user

end
