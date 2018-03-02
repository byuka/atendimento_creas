class Attendance < ApplicationRecord
  belongs_to :service
  belongs_to :technician
  belongs_to :person
  belongs_to :assistance, optional: true

  # validates :technician, :person, :service, presence: true
end
