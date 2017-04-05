class User < ApplicationRecord
    has_secure_password
	validates_presence_of :email
	validates_format_of :email, with: /@/
	validates_uniqueness_of :email, case_sensitive: false	
	#validates :first_name, uniqueness: { case_sensitive: false }
	#validates :role, uniqueness: { case_sensitive: false }


	has_many :images, dependent: :destroy
	has_many :places, dependent: :destroy

end
