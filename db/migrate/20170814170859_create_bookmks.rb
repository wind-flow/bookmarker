class CreateBookmks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmks do |t|
      t.string :bookmktitle
      t.string :bookmkobj
      t.integer :bookmkseq
      t.integer :bookmkclick
      t.integer :bookmkfolder_id
      t.integer :user_id


      t.timestamps
    end
  end
end
