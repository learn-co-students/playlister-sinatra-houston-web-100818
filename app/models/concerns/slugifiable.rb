require_relative '../../../config/environment'

class Slugifiable
# slugify an object's name by stripping out special chars & replacing spaces with '-'
  def self.slug(name)
    name.downcase.gsub(/[^0-9A-Za-z ]/,'').gsub(/ /, '-')
  end

  # use slug method to retrieve an object from db and return that entry
  def self.find_by_slug(slug_name, class_name)
    class_name.all.find do |instance|
      slug(instance.name) == slug_name
    end
  end

end
