class Task < ApplicationRecord
  belongs_to :list

  def open?
    true
  end
end
