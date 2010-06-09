class Sitecontact < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :message
  
  has_attached_file :file,
        :url => "/uploads/:attachment/:id/:basename_:style.:extension",
        :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
end
