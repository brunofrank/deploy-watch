require 'digest/sha1'

class Project < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  belongs_to :user
  has_many :deploys
  
  before_save :generate_uuid
  
  private  
    def generate_uuid
      if self.uuid.nil?
        self.uuid = Digest::SHA1.hexdigest "#{self.id}#{self.name}#{DateTime.now}"
      end
    end  
end
