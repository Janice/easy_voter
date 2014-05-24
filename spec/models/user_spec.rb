require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", badge: "11111",
                     password: "gators", password_confirmation: "gators")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:badge) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }
    describe "when badge is not present" do
    before { @user.badge = " " }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", badge: "11111",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
end

