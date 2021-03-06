# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  authentication_token   :string(255)
#  host_id                :string(255)
#  firstname              :string(255)
#  lastname               :string(255)
#  phone                  :string(255)
#  age                    :integer
#  city                   :string(255)
#  state                  :string(255)
#  zipcode                :integer
#  school                 :string(255)
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
	
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, 
		:firstname, :lastname, :phone, :age, :city, :state, :zipcode, :school


  # validations
  validates_uniqueness_of :email
  validates_presence_of :email, :firstname, :lastname, :encrypted_password


  
end
