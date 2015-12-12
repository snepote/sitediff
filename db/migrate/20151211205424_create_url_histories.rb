class CreateUrlHistories < ActiveRecord::Migration
  def change
    create_table :url_histories do |t|
      t.references :crawler_session, index: true, foreign_key: true
      t.string :url
      t.string :image_path
      t.float :diff_to_previous

      t.timestamps null: false
    end
  end
end
