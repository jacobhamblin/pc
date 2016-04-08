class Taco < ActiveRecord::Base
  has_many :stores_tacos
  has_many :stores, through: :stores_tacos, source: :store

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
