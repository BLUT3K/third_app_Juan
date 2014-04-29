FactoryGirl.define do
	factory :user do
		name "Juan"
		email "juan@example.com"
		password "fubar"
		password_confirmation "fubar"
	end
end