require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User", badge: "55555") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:badge) }

  it { should be_valid }

  describe "when badge is not present" do
    before { @user.badge = " " }
    it { should_not be_valid }
  end

end

