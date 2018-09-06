class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one :cart, dependent: :destroy
  has_many :addresses, inverse_of: :user

  accepts_nested_attributes_for :addresses,
              reject_if: lambda {|attrs| attrs['line1', 'country_code'].blank?},
              allow_destroy: true

end
