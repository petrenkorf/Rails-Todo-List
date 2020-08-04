class Task < ApplicationRecord
  validates :description, presence: true, length: {maximum: 255}

  belongs_to :list

  after_initialize :set_defaults

  def is_done?
    @is_done
  end

  def mark_as_done
    @is_done = true

    self
  end

  protected

  def set_defaults
    @is_done = false
  end
end
