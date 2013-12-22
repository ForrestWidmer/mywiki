class Role < ActiveRecord::Base
   attr_accessible :level

   belongs_to :user
   belongs_to :wiki
   
end
