class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    # 添加管理员
    add_column :users, :admin, :boolean, default: false
  end
end
