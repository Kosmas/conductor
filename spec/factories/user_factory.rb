FactoryGirl.define do
	factory :user do
		name 'tester'
		email 'test@test.com'
		password 'password'
		password_confirmation	'password'
	end
end
