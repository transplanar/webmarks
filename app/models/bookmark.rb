class Bookmark < ActiveRecord::Base
  # REVIEW correct?
  # belongs_to :user

  belongs_to :topic
  has_many :likes, dependent: :destroy
  # REVIEW how to make it validate/autocomplete valid urls?
end
