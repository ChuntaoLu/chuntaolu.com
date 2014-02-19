class AddSourceLinkToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :source_link, :string
  end
end
