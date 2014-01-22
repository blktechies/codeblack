# Post factory for development

FactoryGirl.define do
	factory :post do
		title "Example Post Title"
		category "news"
		source "http://www.example.com/example-post-title"
	end
end