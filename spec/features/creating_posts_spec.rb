# Testing creating content
# Content can be news, jobs, etc.

require 'spec_helper'

feature 'Creating posts' do
	before do
		post = FactoryGirl.create(:post)
		user = FactoryGirl.create(:user)

		visit '/'
		click_link 'Submit News'

		message = "You need to sign in or sign up or something first."
		expect(page).to have_content(message)

		fill_in 'Name', with: user.name
		fill_in 'Password', with: user.password
		click_button 'Sign in'

		click_link 'Submit News'
	end

	scenario 'can create a post' do 
		fill_in 'Title', with: "Example New Post"
		fill_in 'Source', with: "http://www.example.com/example-new-post"
		fill_in 'Category', with: "news"
		click_button 'Create Post'

		expect(page).to have_content('Post has been created.')

		post = Post.where(title: "Example New Post").first
		expect(page.current_url).to eql(post_url(post))

		title = "Example New Post"
		expect(page).to have_title(title)

		within ('#post #author') do
			expect(page).to have_content('By Dev User')
		end
	end

	scenario 'can not create a post without a title' do
		click_button 'Create Post'
		expect(page).to have_content('Post has not been created.')
		expect(page).to have_content("Title can't be blank")
	end
end