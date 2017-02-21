class CreateInfectionAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :infection_alerts do |t|
      t.references :infected_user
      t.references :reporter_user

      t.timestamps
    end
  end
end
