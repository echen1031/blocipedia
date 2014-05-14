# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wiki, :class => 'Wikis' do
    name "MyString"
    description "MyText"
    public false
  end
end
