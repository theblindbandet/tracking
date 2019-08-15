# frozen_string_literal: true

class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.string :title
      t.text :description
      t.decimal :length

      t.timestamps
    end
  end
end
