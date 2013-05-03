# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text
#  password_digest :text
#  plan_id         :integer
#  plan_start      :date
#  customer_id     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates :email, :format => { :with => /.+@.+/, :message => "address is invalid" }
  validates :email, :uniqueness => true
  validates :password, :length => { :minimum => 5 }
  belongs_to :plan
end
