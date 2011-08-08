class << ActiveRecord::Base

  alias_method :singular_method_missing, :method_missing

  # Define an around alias for method_missing: if the given method call is a plural,
  # return an array of attribute values for that method in singular form
  # Otherwise, fallback to the original method missing
  def method_missing(method_id, *args, &block)
    singular_method_id = method_id.to_s.singularize.to_sym

    if method_id == singular_method_id
      singular_method_missing(method_id, *args, &block)
    else
      self.select(singular_method_id).map(&singular_method_id)
    end
  end

end


# This monkey-patches the array class to catch plural method calls.
# It assumes we're running in a rails environment that provides us with
# String#singularize.
# The limitation that this method imposes on rails applications is
# that you cannot have a column with a name that collides with methods
# defined on Array (or on its ancestor).
# i.e. if you have a model named "Diary" with the column "entry", calling 
# Diary.entries will invoke the underlying Object#entries method.  This is 
# undesired behavior and it is up to the developer to wisely avoid these cases. 
class Array
  def method_missing(method_id, *args, &block)

    singular_method_id = method_id.to_s.singularize.to_sym
    if method_id != singular_method_id
      return self.map(&singular_method_id) 
    end
    super
  end
end
