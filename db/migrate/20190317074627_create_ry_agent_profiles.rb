class CreateRyAgentProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :ry_agent_profiles do |t|
      t.string :name
      t.text :address
      t.integer :ry_agent_id, foreign_key: true
      t.float :current_discount

      t.timestamps
    end
  end
end
