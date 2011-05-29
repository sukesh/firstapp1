# == Schema Information
# Schema version: 20110529092007
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base
   attr_accessor   :password
   attr_accessible :name,:email,:password,:password_confirmation
   
   email_regexp = /\A[_a-zA-Z+\-\.0-9]+@[a-z0-9\-.]+\.[a-z]+\z/i

   validates :name, #:presence => true,
                    :length   => {:maximum=>50,:minimum=>1}
   validates :email,:presence => true,
                    :format   => {:with=>email_regexp},
                    :uniqueness=> {:case_sensitive=>false}
   validates :password, :presence => true,
                        :confirmation=>true,
                        :length =>{#:maximum=>20,:minimum=>6
                                     :within=>6..20}

end
