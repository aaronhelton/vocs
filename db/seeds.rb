# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

namespaces = Namespace.create([
    {uri: 'http://www.w3.org/2000/01/rdf-schema#', name: 'rdfs'},
    {uri: 'http://www.w3.org/2002/07/owl#', name: 'owl'},
    {uri: 'http://www.w3.org/1999/02/22-rdf-syntax-ns#', name: 'rdf'},
    {uri: 'http://www.w3.org/2004/02/skos/core#', name: 'skos'},
    {uri: 'http://purl.org/dc/elements/1.1/', name: 'dc'},
    {uri: 'http://www.w3.org/2001/XMLSchema#', name: 'xsd'},
    {uri: 'http://eurovoc.europa.eu/schema#', name: 'eu'},
    {uri: 'http://www.w3.org/2008/05/skos-xl#', name: 'xl'},
    {name: 'xml'}
])

archetypes = Archetype.create([
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'ConceptScheme', routable: true},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'Concept', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'Collection', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'member', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'hasTopConcept', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'topConceptOf', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'inScheme', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'prefLabel', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'altLabel', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'scopeNote', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'broader', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'related', routable: false},
    {namespace_id: (Namespace.find_by name: 'skos').id, name: 'narrower', routable: false},
    {namespace_id: (Namespace.find_by name: 'eu').id, name: 'Domain', routable: false},
    {namespace_id: (Namespace.find_by name: 'eu').id, name: 'domain', routable: false},
    {namespace_id: (Namespace.find_by name: 'eu').id, name: 'MicroThesaurus', routable: false},
    {namespace_id: (Namespace.find_by name: 'eu').id, name: 'microthesaurus', routable: false},
    {namespace_id: (Namespace.find_by name: 'dc').id, name: 'identifier', routable: false},
    {namespace_id: (Namespace.find_by name: 'xml').id, name: 'lang'},
])

langs = Language.create([
    {name: 'ar'},
    {name: 'zh'},
    {name: 'en'},
    {name: 'fr'},
    {name: 'ru'},
    {name: 'es'},
])

Dir.entries('db/seeds').sort.each do |f|
    if f == "." || f == ".." then next end
    p "loading seeds/#{f}"
    require_relative "seeds/#{f}"
    sleep(10)
end
