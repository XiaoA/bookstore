class User < ActiveRecord::Base
  has_many :addresses
  has_many :orders

  has_secure_password
  accepts_nested_attributes_for :addresses

  
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /@/ }


  def full_name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end
