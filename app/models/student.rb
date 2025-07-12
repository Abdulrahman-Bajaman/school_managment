class Student < ApplicationRecord
  belongs_to :school

  validates :full_name, :date_of_birth, :address, :phone_number, presence: true

  validates :phone_number, uniqueness: true

  VALID_PHONE_REGEX = /\A[0-9+\-() ]+\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }

  enum :status, { active: 0, inactive: 1 }

  validates :status, inclusion: { in: statuses.keys }
end

