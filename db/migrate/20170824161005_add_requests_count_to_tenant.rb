class AddRequestsCountToTenant < ActiveRecord::Migration[5.1]
  def change
    add_column :tenants, :requests_count, :integer, default: 0
  end
end
