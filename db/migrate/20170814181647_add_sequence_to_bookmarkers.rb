class AddSequenceToBookmarkers < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmkfolders, :sequence, :integer
  end
end
