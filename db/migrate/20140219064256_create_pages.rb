class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|

    	t.integer "subject_id"
    	#foreignkey 
    	#same as t.references :subject

    	t.string "name"
    	t.integer "permalink"
    	t.integer "position"
    	t.boolean "visible", :default => false

      t.timestamps
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")

    #these are an index on our foreign key. all foreign keys hsould have an index
    #other index added on the permalink 

  end
end


