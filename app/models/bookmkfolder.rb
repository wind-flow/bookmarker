class Bookmkfolder < ApplicationRecord
  resourcify
  include Authority::Abilities
  belongs_to :user
  has_many :bookmks
end
