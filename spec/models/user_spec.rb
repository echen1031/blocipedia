require 'spec_helper'

describe User do
  it 'is invalid without an username' do
    expect(User.new(username: nil)).to have(1).errors_on(:username)
  end

  it { should validate_uniqueness_of(:username) }

  it { should validate_uniqueness_of(:email) }
end
