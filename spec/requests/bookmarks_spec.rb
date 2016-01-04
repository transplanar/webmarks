require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  let(:my_topic){Topic.create!(title: "TestTopic")}

  describe "GET /bookmarks" do
    it "works! (now write some real specs)" do
      # get bookmarks_path
      get topic_bookmarks_path(my_topic)
      expect(response).to have_http_status(200)
    end
  end
end
