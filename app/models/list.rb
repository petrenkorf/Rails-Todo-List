class List < ApplicationRecord
  validates :title, presence: true, length: {maximum: 100}
  validates :public, inclusion: [false, true]

  belongs_to :user

  after_initialize :init

  def public_visibility? 
    return self.public
  end

  def open?
    return !self.closed
  end

  protected
  
  def init
    self.closed = false
    self.public = false
  end
end
