Vocs is a Rails based vocabulary/ontology server platform. It is intended to serve a variety of RDF-compliant schemas, but is currently optimized for SKOS. The dataset underlying it as a demonstration of functionality is the UN's UNBIS Thesaurus, for which it was primarily developed.

I will attempt to maintain a demonstration of the most current functionality here: https://floating-eyrie-8967.herokuapp.com/

There are lots of things left to do:

1. Loosen coupling between Vocs and SKOS to accommodate additional schemas
2. Develop a user authentication and basic security model
3. Implement a search engine
4. Develop administration/management tools to maintain resources
5. Improve performance with better caching (low priority)
6. Construct additional output formats
7. Develop a term proposal, review, and approval workflow
8. Theming
