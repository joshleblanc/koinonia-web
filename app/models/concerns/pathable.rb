module Pathable
    extend ActiveSupport::Concern
  
    def path(root = nil)
      associations = self.class.reflect_on_all_associations(:belongs_to)
      possibilities = associations.map do |association|
        arr = []
        model = send(association.name)
        if model.respond_to? :path
          arr.push *model.path.flatten
        else
          arr.push model
        end
        arr.push(self)
      end
      if possibilities.length > 1 && root.nil?
        raise StandardError.new("Multiple paths detected, and no root provided. Call path with the root node expected")
      elsif possibilities.length > 1
        # if there's more than one possible path, we need to pick
        # the one that contains the root, then modify the path
        # so the root is the first element
        valid_path = possibilities.find do |possibility|
          possibility.any? { |model| model.class == root }
        end
        raise StandardError.new("No path exists with root #{root.name}") if valid_path.nil?
        root_index = valid_path.find_index { |model| model.class == root }
        valid_path[root_index..-1]
      else
        possibilities.first
      end
    end
  end