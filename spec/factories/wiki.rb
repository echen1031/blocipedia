# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wiki, :class => 'Wiki' do
    name "MyString"
    description "MyText"
    public true
  end
end
