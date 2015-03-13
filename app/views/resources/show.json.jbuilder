#json.extract! @resource, :id, :archetype, :relationships, :created_at, :updated_at

json.uri request.protocol + request.host + '/c/' + @resource.literal
json.type @resource.archetype.namespace.uri + @resource.archetype.name
json.relationships @resource.relationships.each do |r|
  json.name r.predicate.namespace.uri + r.predicate.name 
  json.value r.object.literal
  if r.object.language
    json.language r.object.language.name
  end
end