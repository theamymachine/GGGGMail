class AddReadOptionToEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :read_status, :boolean,default: false 
  end
end
