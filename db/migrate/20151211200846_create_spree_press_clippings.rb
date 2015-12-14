class CreateSpreePressClippings < ActiveRecord::Migration
  def change
    create_table :spree_press_clippings do |t|
      t.string :name, null: false, default: '', index: true
      t.datetime :published_at
    end
  end
end
