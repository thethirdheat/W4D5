FactoryBot.define do
  factory :user, class: 'Users' do
    username "johndoe"
    password "password"
    # password_digest
    # session_token
  end
end
