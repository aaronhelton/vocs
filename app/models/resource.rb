class Resource < ActiveRecord::Base
  belongs_to :archetype
  has_many :relationships, foreign_key: 'subject_id'
  has_many :parents, class_name: 'Relationship', foreign_key: 'object_id'
  belongs_to :language
  
  scope :only, ->(resource_type) { joins(:archetype).where('archetypes.name = ?', resource_type) }
end