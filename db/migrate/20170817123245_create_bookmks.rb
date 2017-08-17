class CreateBookmks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmks do |t|
      t.string :bookmkobj
      t.integer :bookmkseq
      t.integer :bookmkclick
      t.references :bookmkfolder, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
