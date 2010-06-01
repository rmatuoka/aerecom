class Print < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :summary
  validates_presence_of :description
  
  
  has_attached_file :image, :styles => { :thumb => "120x70>", :media => "230x140>" },
          :url => "/uploads/:attachment/:id/:basename_:style.:extension",
          :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
end
