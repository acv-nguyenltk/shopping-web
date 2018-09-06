class Address < ApplicationRecord
  belongs_to :user

  # validates :line1, :country_code, presence: true
end
