require 'spec_helper'

describe Wiki do
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:public) }
  it { should validate_presence_of(:name) }
end
