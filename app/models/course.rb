# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ActiveRecord::Base
  has_and_belongs_to_many :curricula
  has_many :sections
end
