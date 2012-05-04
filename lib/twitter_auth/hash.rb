# encoding: UTF-8

require "hashie"

module TwitterAuth
  # Inherits from {https://github.com/intridea/hashie Hashie::Mash}.
  # Provides dot method for attributes access, and raise an exception
  # only when requested attribute not exists.
  # If attribute exists but its value is nil, returns nil.
  class Hash < Hashie::Mash
    def method_missing(method, *args, &block)
      raise NoMethodError unless key? method.to_s
      super
    end
    
    def respond_to?(sym, include_private = false)
      (key? sym.to_s) ? true : super(sym, include_private)
    end
  end
end