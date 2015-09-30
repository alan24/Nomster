FactoryGirl.define do
	factory :user do 
		sequence :email do |e|
			"alan#{e}@gmail.com"
		end
		password "omglolhaha"
		confirm_password "omglolhaha"
	end

	factory :place do
		name "Pizza Place"
		description "They sell pizza."
		latitude(42.3631519)
		longitude(-71.056098)
		association :user
	end

	factory :comment do
		message "omg"
		association :user
		association :place
	end
end