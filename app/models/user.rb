class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A[a-z0-9#_-~!$&'()*+,;=:.%]+@\.[a-z]{2,4}\z/i }


  def full_name
    "#{first_name} #{last_name}"
  end
end
