module ResourcesHelper
  def my_trails
    trails = Array.new
    trail = Hash.new
    if @resource.archetype.name == 'ConceptScheme'
      trail[:c] = {  :label => @resource.relationships.prefLabels_for_this_locale.first.object.literal, 
                      :literal => @resource.literal }
      trails << trail
    elsif @resource.archetype.name == 'Domain'
      trail[:c] = {  :label => @resource.relationships.resourceGroup('inScheme').first.object.relationships.prefLabels_for_this_locale.first.object.literal,
                      :literal => @resource.relationships.resourceGroup('inScheme').first.object.literal } 
      trail[:d] = {  :label => @resource.relationships.prefLabels_for_this_locale.first.object.literal,
                      :literal => @resource.literal } 
      trails << trail
    elsif @resource.archetype.name == 'MicroThesaurus'
      trail[:c] = {  :label => @resource.relationships.resourceGroup('domain').first.object.relationships.resourceGroup('inScheme').first.object.relationships.prefLabels_for_this_locale.first.object.literal,
                      :literal => '' }
      trail[:d] = {  :label => @resource.relationships.resourceGroup('domain').first.object.relationships.prefLabels_for_this_locale.first.object.literal,
                      :literal => '' }
      trail[:m] = {  :label => @resource.relationships.prefLabels_for_this_locale.first.object.literal,
                      :literal => '' }
      trails << trail
    else
      # Concepts can belong to more than one microthesaurus, thus there can be more than one trail
      microthesauri = @resource.relationships.resourceGroup('microthesaurus')
      microthesauri.each do |mt|
        trail[:c] = { :label => mt.object.relationships.resourceGroup('domain').first.object.relationships.resourceGroup('inScheme').first.object.relationships.prefLabels_for_this_locale.first.object.literal,
                      :literal => mt.object.relationships.resourceGroup('domain').first.object.relationships.resourceGroup('inScheme').first.object.literal }
        trail[:d] = { :label => mt.object.relationships.resourceGroup('domain').first.object.relationships.prefLabels_for_this_locale.first.object.literal,
                      :literal => mt.object.relationships.resourceGroup('domain').first.object.literal }
        trail[:m] = { :label => mt.object.relationships.prefLabels_for_this_locale.first.object.literal,
                      :literal => mt.object.literal }
        trail[:t] = { :label => @resource.relationships.prefLabels_for_this_locale.first.object.literal,
                      :literal => @resource.literal }
        trails << trail
      end
      
    end
    return trails
  end
end
