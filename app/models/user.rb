class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :user_group
  after_initialize :init
  
  def init
    self.user_group  ||= UserGroup.find(1)  #will set the default value only if it's nil
  end
end
