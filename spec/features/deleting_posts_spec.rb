# Testing deleting content

require 'spec_helper'

feature "Deleting posts" do
  scenario "Deleting a post" do
    FactoryGirl.create(:post, title: "Example Post Title")
    
    visit "/"
    click_link "Example Post Title"
    click_link "Delete Post"
    
    expect(page).to have_content("Post has been destroyed.")
		visit "/"
    
    expect(page).to have_no_content("Example Post Title")
  end
end
