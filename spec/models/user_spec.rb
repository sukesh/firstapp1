 require 'spec_helper'

describe User do
    before(:each) do
      @attr={:name=>"Example User",:email=>"user@example.com"} 
    end
    it "should create a new instance given a valid attribute" do
      User.create!(@attr)
    end
     
    it "should require a name" do
      no_name_user=User.new(@attr.merge(:name=>""))
      no_name_user.should_not be_valid
    end

     it "should have an eamil address" do
      no_email_user=User.new(@attr.merge(:email=>""))
      no_email_user.should_not be_valid
    end
    it "should reject names that are too long" do
       name= "a"*51
       User.new(@attr.merge(:name=>name)).should_not be_valid
    end
    it "should have a valid email address" do
       addresses=%w[foo@bar.com FOO_USER@foo.bar.org first.last@foo.jp]
       addresses.each do |address|
       User.new(@attr.merge(:email=>address)).should be_valid
       end
     end
    it "should reject invalid emails" do
       addresses=%w[foo.org foo.bar@ss. bar,com]
       addresses.each do |address|
       User.new(@attr.merge(:email=>address)).should_not be_valid
       end
    end 
    it "should reject duplicate emails" do
        User.create!(@attr)
        duplicat_email=User.new(@attr)
        duplicat_email.should_not be_valid
      
    end

    it "should have case sensitive email,it should reject otherwise" do
       case_email=@attr[:email].upcase 
       User.create!(@attr.merge(:email=>case_email))
       duplicat_email=User.new(@attr)
       duplicat_email.should_not be_valid
        
    end
end