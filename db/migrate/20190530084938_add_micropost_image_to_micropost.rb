class AddMicropostImageToMicropost < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :micropost_image, :string
  end
end
