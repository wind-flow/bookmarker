class Bookmk < ApplicationRecord
  belongs_to :bookmkfolder
  belongs_to :user
end
