class User < ActiveRecord::Base
  has_many :referrals
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
