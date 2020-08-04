class Task < ApplicationRecord
  validates :description, presence: true, length: {maximum: 255}

  belongs_to :list

  def open?
    true
  end
end
