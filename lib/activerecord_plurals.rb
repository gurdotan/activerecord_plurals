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


  alias_method :singular_respond_to?, :respond_to?

  # Respond to all plurals methods as well
  def respond_to?(*args)
    return true if singular_respond_to?(*args)
    singular_method_id = args[0].to_s.singularize.to_sym
    instance_methods.include?(singular_method_id)
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

  # Respond also to methods on arrays of ActiveRecord instances.
  # Note: There is intentionally no restriction on the uniformity of instances in the array,
  # i.e. they don't have to all be of the same class.  This is useful when you have a mixed array
  # with objects that share the same attributes (Dog, Labrador < Dog for example) and follows ruby's
  # duck-typing conventions.
  def respond_to?(symbol, include_private=false)
    super or all?{|e| e.is_a?(ActiveRecord::Base) && e.class.respond_to?(symbol)}
  end

end
