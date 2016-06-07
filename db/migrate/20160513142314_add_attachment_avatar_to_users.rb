class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :users, :avatar
  end



  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png" 
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
