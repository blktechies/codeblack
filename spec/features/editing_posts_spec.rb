# Testing editing content
# content should be mutable

require 'spec_helper'

feature 'Editing posts' do
	before do
		FactoryGirl.create(:post, title: "Example Post Title")

		visit '/'
		click_link "Example Post Title"
		click_link "Edit Post"
	end

	scenario 'updating a post' do
		fill_in 'Title', with: "Example Post Title"
		click_button 'Update Post'

		expect(page).to have_content("Post has been updated.")
	end

	scenario "Updating a post with invalid attributes won't work" do
		fill_in 'Title', with: "" #empty title
		click_button 'Update Post'

		expect(page).to have_content("Post has not been updated.")
	end
end