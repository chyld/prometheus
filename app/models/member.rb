# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  email      :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Member < ActiveRecord::Base
  attr_accessible :email
  belongs_to :user
end
