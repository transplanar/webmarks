class Bookmark < ActiveRecord::Base
  belongs_to :topic
  # REVIEW how to make it validate/autocomplete valid urls?
end
