require 'spec_helper'

describe Wiki do
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:public) }
  it { should validate_presence_of(:name) }
  it { should respond_to(:user_id) }
  
  it 'is invalid without an user id' do
    expect(Wiki.new(user_id: nil)).to have(1).errors_on(:user_id)
  end
end
