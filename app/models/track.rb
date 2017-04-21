# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  bonus      :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :name, presence: true
  validates :bonus, inclusion: [true, false]

  has_many :notes,
    dependent: :destroy

  belongs_to :album
end
