class Bookmkfolder < ApplicationRecord
  resourcify
  include Authority::Abilities
  belongs_to :user

  belongs_to :bookmkid, required: false
  belongs_to :email, required: false
end
