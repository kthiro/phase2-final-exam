class CreateMonologues < ActiveRecord::Migration[5.1]
  def change
    create_table :monologues do |t|
      t.text :content

      t.timestamps
    end
  end
end
