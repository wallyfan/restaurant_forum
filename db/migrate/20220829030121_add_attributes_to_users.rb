class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change

    add_column :users, :name, :string
    add_column :users, :intro, :text
    add_column :users, :avatar, :string # 用來掛載 CarrierWave 的 Uploader

  end
end
