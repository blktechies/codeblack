# User development factory

FactoryGirl.define do
	factory :user do
		name "Dev User"
		email "user@example.com"
		password "passw0rd"
		password_confirmation "passw0rd"

		factory :admin_user do
			admin true
		end
	end
end