class List < ApplicationRecord
  validates :title, presence: true, length: {maximum: 100}
  validates :public, inclusion: [false, true]

  belongs_to :user
  has_many :tasks
  has_many :bookmarks

  accepts_nested_attributes_for :tasks

  scope :visible_for_users, ->{ where(public: true) }
  scope :not_belonging_to_user, -> (user) { where("user_id != ?", user.id) }

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

  def bookmark_user_ids
    self.bookmarks.map(&:user_id)
  end
end
