# Testing creating content
# Content can be news, jobs, etc.

require 'spec_helper'

feature 'Creating posts' do 
	scenario 'can create a post' do 
		visit '/'

		click_link 'Submit News'

		fill_in 'Title', with: "Example New Post"
		fill_in 'Source', with: "http://www.example.com/example-new-post"
		fill_in 'Category', with: "news"
		click_button 'Create Post'

		expect(page).to have_content('Post has been created.')

		post = Post.where(title: "Example New Post").first
		expect(page.current_url).to eql(post_url(post))

		title = "Example New Post"
		expect(page).to have_title(title)
	end
end