class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes, dependent: :destroy

  after_create :get_image_url

  def get_image_url
    embedly_api = Embedly::API.new :key => '26a9fb768d544a9ca54c83db83eeabd0',
        :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
        obj = embedly_api.extract :url => url

    embedly_data = obj[0].marshal_dump
    update_attribute(:image_url, embedly_data[:images].first["url"])
  end
end
