class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one :cart, dependent: :destroy
  after_create :create_cart

  def create_cart
    Cart.create(user: self)
  end
end
