# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  name       :string           not null
#  genre      :string
#  album_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :name, :band_id, presence: true
  validates :album_type, inclusion: ['studio', 'live', nil]

  has_many :tracks,
    dependent: :destroy
    
  belongs_to :band
end
