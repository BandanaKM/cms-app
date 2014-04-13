class CreateSectionEdits < ActiveRecord::Migration
	
  def change
    create_table :section_edits do |t|
    	t.references :admin_user
    	t.references :section
    	t.string :summary 
      t.timestamps
    end
    add_index :section_edits, ["admin_user_id", "section_id"]
  end
end

#summary is the presence of the admin user editing the section