class CreateWebhookProcessors < ActiveRecord::Migration
  def change
    create_table :webhook_processors do |t|

      t.timestamps
    end
  end
end
