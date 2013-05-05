# == Schema Information
#
# Table name: units
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  section_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Unit < ActiveRecord::Base
  belongs_to :section
  has_and_belongs_to_many :users
end
