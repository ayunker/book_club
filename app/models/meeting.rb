# == Schema Information
#
# Table name: meetings
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Meeting < ApplicationRecord
  has_many :books, dependent: :destroy
end
