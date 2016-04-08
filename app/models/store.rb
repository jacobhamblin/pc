class Store < ActiveRecord::Base
  has_many :stores_tacos
  has_many :stores_salsas
  has_many :car_washes
  belongs_to :city
  has_many :tacos, through: :stores_tacos, source: :taco
  has_many :salsas, through: :stores_salsas, source: :salsa
end
