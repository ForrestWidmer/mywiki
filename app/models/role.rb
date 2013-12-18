class Role < ActiveRecord::Base
   attr_accessible :title, :body

   belongs_to :user
   belongs_to :collaboration
   belongs_to :wiki
   # Wasn't sure which belongs_to's should be here
   # because we have a role in our collaboration table
   # and I thought you were talking about having a role 
   # on a wiki, owner, as well.  


end
