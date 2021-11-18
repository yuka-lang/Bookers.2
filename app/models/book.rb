class Book < ApplicationRecord

   belongs_to :user
   attachment :image
   attachment :profile_image

end
