class CreateBookmks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmks do |t|
      t.string :bookmkTitle, default: ""
      t.string :bookmkLink, default: "#"
      t.string :bookmkImgUrl, default: ""
      t.integer :bookmkseq
      t.integer :bookmkclick

      # t.integer :bookmkfolder_id
      t.references :bookmkfolder, foreign_key: true
      t.references :user, foreign_key: true, required: false

      t.timestamps
    end
  end
end
