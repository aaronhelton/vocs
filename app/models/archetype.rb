class Archetype < ActiveRecord::Base
  belongs_to :namespace
  has_many :resources
  has_many :relationships

end
