class Salsa < ActiveRecord::Base
  has_many :stores_salsas
  has_many :stores, through: :stores_salsas, source: :store

  def unique_stores
    names = Hash.new(false)
    uniq = []
    self.stores.each do |obj|
      name = obj.name
      uniq << obj if names[name] == false
      names[name] = true
    end
    uniq
  end
end
