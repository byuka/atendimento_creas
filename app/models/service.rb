class Service < ApplicationRecord
    has_many :attendances

    validates :nome, presence: true,
                     uniqueness: { case_sensitive: false }

     def to_label
         nome
     end
end
