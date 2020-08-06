class Task < ApplicationRecord
  validates :description, presence: true, length: {maximum: 255}

  belongs_to :taskable, polymorphic: true
  has_many :tasks, as: :taskable

  after_initialize :set_defaults

  def is_done?
    !@is_open
  end

  def mark_as_done
    @is_open = false

    self
  end

  protected

  def set_defaults
    @is_open ||= true
  end
end
