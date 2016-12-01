class UpdateVisitsShortenedUrlColumnType < ActiveRecord::Migration
  def change
    drop_table :visits

    create_table :visits do |t|
      t.integer :user_id
      t.integer :shortened_url_id

      t.timestamps
    end

    add_index :visits, [:user_id, :shortened_url_id]
  end
end
