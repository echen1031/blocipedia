require 'spec_helper'

describe User do
  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:role) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }

  it 'has a valid factory' do
    FactoryGirl.create(:user).should be_valid
  end

  it 'is invalid without an username' do
    expect(User.new(username: nil)).to have(1).errors_on(:username)
  end
end
