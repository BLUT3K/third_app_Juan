require 'spec_helper'

describe User do

	before { @user = User.new(name: "Example User", email: "user@exmple.com",
	  password: "fubar", password_confirmation: "fubar")}

	subject{ @user }

	it { should respond_to(:name) }
	it { should respond_to(:email)}
	it { should respond_to(:password_digest}
	it { should respond_to(:password)}
	it { should respond_to(:password_confirmation)}	
	it { should respond_to(:authenticate)}	
	it { should respond_to(:authenticate)}	

	it { should be_valid}

	describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid}
	end

	describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid}
	end

	describe "when name is long" do
		before { @user.name = "b" * 31 }
		it { should_not be_valid}
	end

	describe "when email format is valid" do
		it "should be valid" do
		addresses = %w[user@foo,com user_at_foo.org example.use@foo.]
		addresses.each do |invalid_address|
			@user.email = invalid_address
			@user.should_not be_valid
		end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
		addresses = %w[user@foo.com user@foo.jp example+me@foo.edu]
		addresses.each do |valid_address|
			@user.email = valid_address
			@user.should be_valid
		end
		end
	end

	describe "when eamil address is taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.eamil.upcase
			user_with_same_email.save 
		end

	it { should_not be_valid }
	end

	describe "when password is not present" do 
	  before { @user.password = @user.password_confirmtion = " "}.
	  it { should_not be_valid }
	end
	decribe "when passwords mismatch" do
		before { @user.password_confirmation = "mismatch"}
		it { should_not be_valid }
	end

	describe "when confirmation is nil" do
		before { @user.password_confirmation = nil }
		it { should_not be_valid}
	end

	describe "when password is to small" do
		before { @user.password = @user.password_confirmation = "a" * 4 }
		it { should_not be_valid}
	end

	describe "return value of authentication method" do
		before {@user.save}
		let(:found_user) { User.find_by_email(@user.email) }

	describe "with valid password" do
		it { should == found_user.authenticate(@user.password)}
	end

	describe "with invlid password" do
		let(:user_for_invlid_password) { found_user.authenticate("invalid") }

		it {should_not == user_for_invlid_password}
		specify { user_for_invlid_password.should be_false }
	end
  end
end		