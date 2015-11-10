FactoryGirl.define do
  factory :team do
    name "MyString"

    after(:create) do |team|
      team.users << create(:user)
    end
  end
end
