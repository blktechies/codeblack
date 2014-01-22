# Testing editing content
# content should be mutable

require 'spec_helper'

feature 'Editing posts' do
	let!(:user) { FactoryGirl.create(:user) }
	let!(:post) do
		post = FactoryGirl.create(:post)
		post.update(user: user)
		return post
	end

	before do
		sign_in_as!(user)

		visit '/'
		click_link post.title
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