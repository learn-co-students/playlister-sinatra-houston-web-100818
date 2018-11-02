module Slugifiable 

    module InstanceMethods
        def slug
          self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end  
    end

end 