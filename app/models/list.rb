class List < ApplicationRecord
  validates :title, presence: true, length: {maximum: 100}
  validates :public, inclusion: [false, true]

  belongs_to :user
  has_many :tasks

  accepts_nested_attributes_for :tasks

  after_initialize :init

  def public_visibility? 
    self.public
  end

  def open?
    !self.closed
  end

  def closed?
    !open?
  end

  def close
    self.closed = true

    self
  end

  protected
  
  def init
    self.closed = false
    self.public = false
  end
end
