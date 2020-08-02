class List < ApplicationRecord
  validates :title, presence: true
  validates :public, inclusion: [false, true]

  belongs_to :user
end
