class CreateCalendarEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :calendar_events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
