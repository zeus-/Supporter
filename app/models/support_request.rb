class SupportRequest < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  DEPARTMENT = ['sales', 'marketing','tech']
  after_initialize :set_defaults

 def self.search(x)
   where("name like ? OR email like ? OR message like ?", "%#{x}%", "%#{x}%", "%#{x}%" ) 
 end

  def set_defaults
   self.action = false if self.action.nil?   
  end 
end
