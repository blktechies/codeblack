# Testing deleting content

require 'spec_helper'

feature "Deleting posts" do
	let!(:user) { FactoryGirl.create(:user) }
	let!(:post) do
		post = FactoryGirl.create(:post)
		post.update(user: user)
		return post
	end

  before do
  	sign_in_as!(user)
  	visit user_path(user)
  end

  scenario "Deleting a post" do
    click_link "Delete Post"
    
    expect(page).to have_content("Post has been destroyed.")
		visit "/"
    
    expect(page).to have_no_content(post.title)
  end
end
