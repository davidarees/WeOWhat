class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :event_ids
  
  # attr_accessible :title, :body

  has_many :authentications

  has_many :payments, through: :payer
  has_many :payments, through: :debtor
  
  has_and_belongs_to_many :events

  def self.find_for_oauth(auth, signed_in_user=nil)
   if user = signed_in_user || self.find_by_email(auth.info.email)
        user.name = auth.info.name if user.name.blank?
        user.save
      elsif auth_record = Authentication.find_by_provider_and_uid(auth.provider, auth.uid)
        return auth_record.user
      else 
        user = User.create do |user|
          user.name = auth.info.name
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.first_name = auth.info.first_name 
          user.last_name = auth.info.last_name 
          user.image = auth.info.image
          user.link = auth.extra.raw_info.link 
        end
      end
    if user.persisted?
      user.authentications.where(auth.slice(:provider, :uid)).first_or_create!
    end
    user
  end
  # devise will call this, we wont ever need to do it
  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session["devise.google_data"]
        user.name = auth.info.name
        user.email = auth.info.email
      end
    end
  end

end
