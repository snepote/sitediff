class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.string :file_path

      t.timestamps null: false
    end
  end
end
