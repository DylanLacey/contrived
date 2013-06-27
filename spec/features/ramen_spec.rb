require "spec_helper"

describe "Wikipedia's Ramen Page", :type => :feature, :sauce => true do
  it "Should mention the inventor of instant Ramen" do
    visit "http://en.wikipedia.org/"
    fill_in 'search', :with => "Ramen"
    click_button "searchButton"
    page.should have_content "Japanese noodle soup"
  end 
end
