class List < ApplicationRecord
  validates :title, presence: true, length: {maximum: 100}
  validates :public, inclusion: [false, true]

  belongs_to :user
  has_many :tasks

  accepts_nested_attributes_for :tasks

  scope :visible_for_users, ->{ where(public: true) }

  def public_visibility? 
    self.public
  end

  def open?
    !self.closed
  end

  def closed?
    !self.open?
  end

  def close
    self.closed = true

    self
  end

end
