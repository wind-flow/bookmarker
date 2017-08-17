class AddBookmkfolderToBookmks < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookmks, :bookmkfolder, foreign_key: true
  end
end
