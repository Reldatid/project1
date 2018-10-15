class Note < ApplicationRecord

  belongs_to :location, optional: true
  

end
