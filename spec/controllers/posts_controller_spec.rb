require 'spec_helper'

describe PostsController do
	let(:user) { FactoryGirl.create(:user) }

	context "standard users" do
		before do
			sign_in(user)
		end
	end

	it "displays and error for a missing post" do
		get :show, id: 'non-existant-post'
		expect(response).to redirect_to(posts_path)
		message = "The post you were looking for could not be found."
		expect(flash[:alert]).to eql(message)
	end
end
