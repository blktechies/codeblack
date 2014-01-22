require 'spec_helper'

describe Admin::UsersController do
	let(:user) { FactoryGirl.create(:user) }

	context "standard users" do
		before { sign_in(user) }
	end
end
