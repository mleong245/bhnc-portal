class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :events,  join_table: 'users_events'
  has_and_belongs_to_many :available_hours,  join_table: 'user_hours'
  validates_formatting_of :first_name, :using => :alpha
  validates_formatting_of :last_name, :using => :alpha
  validates_formatting_of :email, :using => :email
  has_many :space_rental_requests, :dependent => :nullify

  after_create :send_confirmation_email

  def available?(day, time)
    hour = AvailableHour.where(:day_of_week => day, :start => time)
    self.available_hours.include?(hour.first)
  end

  def send_confirmation_email
    ConfirmationMailer.user_created(self).deliver
  end

end
