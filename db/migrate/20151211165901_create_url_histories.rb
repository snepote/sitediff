class CreateUrlHistories < ActiveRecord::Migration
  def change
    create_table :url_histories do |t|
      t.references :url, index: true, foreign_key: true
      t.references :crawler_session, index: true, foreign_key: true
      t.references :screenshot, index: true, foreign_key: true
      t.float :diff_to_previous

      t.timestamps null: false
    end
  end
end
