class CreateReviewsControllers < ActiveRecord::Migration
  def change
    create_table :reviews_controllers do |t|

      t.timestamps
    end
  end
end
