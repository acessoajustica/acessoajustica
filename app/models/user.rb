class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            :presence => true,
            :uniqueness => {:case_sensitive => false}

  has_and_belongs_to_many :roles

  belongs_to :membro

  def active_for_authentication?
    super && self.active? # i.e. super && self.is_active
  end

  def inactive_message
    "Desculpe, esta conta foi desativada por um diretor."
  end

  def role?( role )
    !roles.find_by_name( role.to_s ).nil?
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end
end
