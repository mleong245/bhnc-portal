class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_formatting_of :first_name, :using => :alpha
  validates_formatting_of :last_name, :using => :alpha
  validates_formatting_of :email, :using => :email
  validates_formatting_of :zip_code, :using => :us_zip, :allow_blank => true
  validates_formatting_of :phone, :using => :us_phone, :allow_blank => true
  validates_formatting_of :street_address, :using => :address, :allow_blank => true
  has_and_belongs_to_many :events,  join_table: 'users_events'
  
end
