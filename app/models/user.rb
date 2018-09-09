class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one :cart, dependent: :destroy
  has_many :addresses, inverse_of: :user
  has_many :orders, dependent: :destroy

  # validates :firstname, :lastname, :phoneNumber, presence: true

  accepts_nested_attributes_for :addresses,
              reject_if: %w[line1 country_code].nil?,
              allow_destroy: true

end
