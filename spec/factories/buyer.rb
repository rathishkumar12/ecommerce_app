FactoryBot.define do 
	factory :buyer do 
		email {'18tucs041@skct.edu.in'}
		buyer_name {'rathish'}
		phone_number {8667325496}
		password {'rathish123'}
		is_active {true}
		after(:build)   { |u| u.skip_confirmation_notification! }
        after(:create)  { |u| u.confirm }
	end

end