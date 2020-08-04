class Task < ApplicationRecord
  validates :description, presence: true

  belongs_to :list

  def open?
    true
  end
end
