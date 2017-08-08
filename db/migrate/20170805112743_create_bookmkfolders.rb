class CreateBookmkfolders < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmkfolders do |t|
      t.string :bookmkfolderid
      t.string :bookmkfoldertitle
      t.string :bookmkfoldercolor
      t.integer :bookmkfolderseq
      t.integer :bookmkfolderclick
      t.references :bookmkid, foreign_key: true
      t.references :email, foreign_key: true

      t.timestamps
    end
  end
end
