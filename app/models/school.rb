class School < ApplicationRecord
  enum :status, { active: 0, inactive: 1 }

  validates :name_en, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 },
                      format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows English letters" }

  validates :name_ar, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 },
                      format: { with: /\A[\p{Arabic}\s]+\z/, message: "only allows Arabic letters" }

  validates :status, presence: true, inclusion: { in: statuses.keys }
end
