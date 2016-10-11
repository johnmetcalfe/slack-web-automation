require 'yaml'

class TestData
  private_class_method :new

  @@data = {}

  def self.load
    Dir[File.dirname(__FILE__) + "/test_data/*.yml"].each do |file|
      @@data.merge! YAML.load(File.open(file))
    end
    @@data = JSON.parse(JSON[@@data], symbolize_names: true)
  end

  def self.method_missing(name, *args, &block)
    if name == :new
      raise NoMethodError, "private method `new' called for #{self}:#{self.class}"
    elsif @@data[name]
      @@data[name]
    else
      raise NoMethodError, "No test data matches `#{name}'"
    end
  end

  def self.method_missing(name, *args, &block)
    if name == :new
      raise NoMethodError, "private method `new' called for #{self}:#{self.class}"
    elsif @@data[name]
      @@data[name]
    else
      raise NoMethodError, "No test data matches `#{name}'"
    end
  end

  def self.respond_to_missing?(name, include_private = false)
    !!(@@data[name]) || super
  end
end
