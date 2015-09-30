FactoryGirl.define do
	factory :user do 
		sequence :email do |e|
			"alan#{e}@gmail.com"
		end
		password "omglolhaha"
		password_confirmation "omglolhaha"
	end

	factory :place do
		name "Pizza Place"
		address "123 Fake Street"
		description "They sell pizza"
		latitude(42.3631519)
		longitude(-71.056098)
		association :user
	end

	factory :comment do
		message "omg"
		rating "1_star"
		association :user
		association :place
	end
end