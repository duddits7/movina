class User < ActiveRecord::Base
  rolify
  after_create :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :zxcvbnable

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :email
  validates_uniqueness_of :email


	def send_devise_notification(notification, *args)
		devise_mailer.send(notification, self, *args).deliver_later
  end

  private
  def set_default_role
    add_role(:user)
  end

end
