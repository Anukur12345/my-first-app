class AddStatusToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :status, :boolean, default: false
  end
end
