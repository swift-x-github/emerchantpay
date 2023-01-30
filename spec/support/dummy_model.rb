# frozen_string_literal: true

class DummyModel
  SUPPORTED_ENTITIES = %i[
    user
  ].freeze

  def self.generate(entity, *args)
    modules = args[0] || []
    attr_accessors = args[1] || []
    new.__send__(entity, modules, attr_accessors)
  end

  def method_missing(method_name, *args, &block)
    if SUPPORTED_ENTITIES.include?(method_name.to_sym)
      generate_class(method_name.to_s, *args)
    else
      super
    end
  end

  def respond_to_missing?(_method_name)
    true
  end

  private

  def generate_class(entity, modules, attr_accessors = [])
    Class.new(ApplicationRecord) do
      modules.each { |module_| include module_ }

      attr_accessor(*attr_accessors) if attr_accessors.present?

      define_singleton_method(:name) do
        entity.classify # user -> User
      end

      define_singleton_method(:table_name) do
        entity.pluralize # user -> users
      end

      define_singleton_method(:to_s) do
        entity # user -> user
      end
    end
  end
end
