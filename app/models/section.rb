# == Schema Information
#
# Table name: sections
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  course_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Section < ActiveRecord::Base
  belongs_to :course
  has_many :units
end
