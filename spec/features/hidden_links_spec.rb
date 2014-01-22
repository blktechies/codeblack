# Hide links for non-authorized users

require 'spec_helper'

feature "hidden links" do
	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:admin_user) }

	context "anonymous users" do
    scenario "cannot see the Submit News link" do
			visit '/'
      assert_link_for "Submit News"
    end
	end

  context "regular users" do
    before { sign_in_as!(user) }
    scenario "cannot see the New Project link" do
			visit '/'
     	assert_no_link_for "Sign up"
     	assert_no_link_for "Sign in"
    end
	end

  context "admin users" do
    before { sign_in_as!(admin) }
    scenario "can see the Submit News link" do
			visit '/'
      assert_link_for "Submit News"
      assert_no_link_for "Sign up"
     	assert_no_link_for "Sign in"
    end
	end
end