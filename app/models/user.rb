# == Schema Information
# Schema version: 20110527035422
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
   attr_accessible :name,:email
   
   email_regexp = /\A[_a-zA-Z+\-\.0-9]+@[a-z0-9\-.]+\.[a-z]+\z/i

   validates :name, #:presence => true,
                    :length   => {:maximum=>50,:minimum=>1}
   validates :email,:presence => true,
                    :format   => {:with=>email_regexp},
                    :uniqueness=> {:case_sensitive=>false}

end
