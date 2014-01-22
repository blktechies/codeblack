# Testing viewing content
# anyone should be able to view content

require 'spec_helper'

feature 'Viewing posts' do

	scenario 'listing all posts' do
		user = FactoryGirl.create(:user)
		post = FactoryGirl.create(:post, title: "Example Post Title", 
																category: "news", 
																source: "http://www.example.com/example-post-title")
		post.update(user: user)
		visit '/'
		click_link "Example Post Title"
		expect(page.current_url).to eql(post_url(post))
	end
end
