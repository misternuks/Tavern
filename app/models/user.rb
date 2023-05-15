class User < ApplicationRecord
<<<<<<< HEAD
=======
  has_many :dm_profiles

>>>>>>> d95bd180cad4a116a69d1b75ae29dbaaa0b67244
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
