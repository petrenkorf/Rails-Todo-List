class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :list

  scope :from_user, ->(current_user) { where(user_id: current_user.id) }
end
