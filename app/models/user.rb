class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :companies
 has_many :jobs, through: :companies
 has_many :categories, through: :jobs
 has_many :contracts, through: :jobs
end
