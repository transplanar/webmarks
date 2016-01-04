require "rails_helper"

# REVIEW how do I get these routing specs to work with nested routes?
RSpec.describe BookmarksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      # expect(:get => "/bookmarks").to route_to("bookmarks#index")
      expect(:get => "/topics/1/bookmarks").to route_to("bookmarks#index")
    end

    it "routes to #new" do
      expect(:get => "/topics/1/bookmarks/new").to route_to("bookmarks#new")
    end

    it "routes to #show" do
      expect(:get => "/topics/1/bookmarks/1").to route_to("bookmarks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/topics/1/bookmarks/1/edit").to route_to("bookmarks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/topics/1/bookmarks").to route_to("bookmarks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/topics/1/bookmarks/1").to route_to("bookmarks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/topics/1/bookmarks/1").to route_to("bookmarks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/topics/1/bookmarks/1").to route_to("bookmarks#destroy", :id => "1")
    end

  end
end
