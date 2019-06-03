class RemoveMicropostImageFromMicroposts < ActiveRecord::Migration[5.2]
  def change
    remove_column :microposts, :micropost_image, :string
  end
end
