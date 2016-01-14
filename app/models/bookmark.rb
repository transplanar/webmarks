class Bookmark < ActiveRecord::Base
  # REVIEW correct?
  # belongs_to :user

  belongs_to :topic
  has_many :likes, dependent: :destroy
  # REVIEW how to make it validate/autocomplete valid urls?

  # after_save
  # store first image to image_url

  # after_save :get_image_url
  # TODO also call this on update
  after_create :get_image_url

  # validates :url, :format => URI::regexp(%w(http https))

  # validates :image_url, :url => true, @options={:message => "my custom error"}
  # validates :homepage, :message => "my custom error", :url => true
  validates :homepage, :url => true

  def get_image_url
    embedly_api = Embedly::API.new :key => '26a9fb768d544a9ca54c83db83eeabd0',
        :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
    # url = 'http://www.guardian.co.uk/media/2011/jan/21/andy-coulson-phone-hacking-statement'
    # url =
    obj = embedly_api.extract :url => url
    # puts "<<<<<<<<<<<<<<<<<<<<<<EMBEDLY STUFF"
    # puts JSON.pretty_generate(obj[0].marshal_dump)
    # embedly_data = JSON.pretty_generate(obj[0].marshal_dump)
    # puts "IMAGE URL = " + embedly_data.find(:images).to_s
    # puts "IMAGE URL = "
    # thing = embedly_data[:images].find(:url).to_s
    # puts embedly_data[:images].first["url"]
    # puts embedly_data
    # :image_url = embedly_data[:images].first["url"]

    #TODO how to validate url
    embedly_data = obj[0].marshal_dump
    update_attribute(:image_url, embedly_data[:images].first["url"])
  end
end
