class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :from_user
      t.string :language
      t.string :q

      t.timestamps
    end
  end
end
