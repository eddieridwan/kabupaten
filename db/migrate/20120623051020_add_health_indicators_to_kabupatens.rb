class AddHealthIndicatorsToKabupatens < ActiveRecord::Migration
  def change
    add_column :kabupatens, :health_indicators, :text
  end
end
