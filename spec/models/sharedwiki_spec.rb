require 'spec_helper'

describe Sharedwiki do
  it { should respond_to(:user_id) }
  it { should respond_to(:wiki_id) }
  it 'is invalid without an user id' do
    expect(Sharedwiki.new(user_id: nil)).to have(1).errors_on(:user_id)
  end

  it 'is invalid without an wiki_id' do
    expect(Sharedwiki.new(wiki_id: nil)).to have(1).errors_on(:wiki_id)
  end
end
