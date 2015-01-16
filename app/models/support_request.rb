class SupportRequest < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  DEPARTMENT = ['sales', 'marketing','tech']
  after_save :set_defaults
  scope :action_scope, -> { order("action DESC") } 

 def self.search(x)
   where("name like ? OR email like ? OR message like ?", "%#{x}%", "%#{x}%", "%#{x}%" ) 
 end

  def set_defaults
   self.action = false   
  end 
end
