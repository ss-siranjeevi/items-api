class AddOfferReferenceToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :offer, null: false, foreign_key: true
  end
end
