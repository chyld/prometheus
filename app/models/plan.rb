# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  name       :text
#  timeframe  :text
#  amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plan < ActiveRecord::Base
  attr_accessible :name, :timeframe, :amount
  has_many :users
end
