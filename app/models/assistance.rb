class Assistance < ApplicationRecord
    has_many :attendances
    #validates :nome, presence: true,
    #               uniqueness: { case_sensitive: false }

   def name
       nome
   end
end
