class User < ApplicationRecord
    has_secure_password
	validates_presence_of :email
	validates_format_of :email, with: /@/
	validates_uniqueness_of :email, case_sensitive: false	
	#validates :first_name, uniqueness: { case_sensitive: false }
	#validates :role, uniqueness: { case_sensitive: false }


	has_many :images, dependent: :destroy
	has_many :places, dependent: :destroy



def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now

  save!
  UserMailer.password_reset(self).deliver
end

#auth token for forget password

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end


end
