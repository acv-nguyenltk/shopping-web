class Address < ApplicationRecord
  extend Enumerize
  belongs_to :user

  enumerize :country_code, in: ISO3166::Country.translations.invert

  # validates :line1, :country_code, presence: true
end
