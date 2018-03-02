class Technician < ApplicationRecord
    has_many :attendances

    validates :nome, presence: true

    def to_label
        nome
    end
end
