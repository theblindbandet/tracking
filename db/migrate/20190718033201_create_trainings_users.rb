# frozen_string_literal: true

class CreateTrainingsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings_users do |t|
      t.references :training, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
