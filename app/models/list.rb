class List < ApplicationRecord
  validates :title, presence: true, length: {maximum: 100}
  validates :public, inclusion: [false, true]

  belongs_to :user
end
