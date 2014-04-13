class SectionEdit < ActiveRecord::Base

	belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
	belongs_to :section 

end

#remember syntax for foreign key 

#why would I need a foreign key here?
#we need to tell it that the foreign key is the admin_user_id. you only need to specify this if the foreign key is aliased

