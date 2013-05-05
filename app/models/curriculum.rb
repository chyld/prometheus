# == Schema Information
#
# Table name: curricula
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Curriculum < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :courses
end
