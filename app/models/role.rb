class Role < ActiveRecord::Base
   attr_accessible :level, :wiki_id, :user_id

   belongs_to :user
   belongs_to :wiki #, inverse_of: :roles
   
end
