class Relationship < ActiveRecord::Base
  belongs_to :subject, class_name: 'Resource', foreign_key: 'subject_id'
  belongs_to :predicate, class_name: 'Archetype', foreign_key: 'predicate_id'
  belongs_to :object, class_name: 'Resource', foreign_key: 'object_id'
  
  
  scope :prefLabels_for_this_locale, -> { 
    joins(:object)
    .where('resources.archetype_id = ?', (Archetype.find_by name: 'prefLabel').id)
    .where('resources.language_id =?', (Language.find_by name: I18n.locale).id)
  }  
  scope :resourceGroup, ->(resource_type) {
    joins(:object)
    .where('predicate_id = ?', (Archetype.find_by name: resource_type).id)
  }
end