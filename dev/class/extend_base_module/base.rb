require 'pry'
require_relative './mods/a.rb'
require_relative './mods/b.rb'

module Events
  def self.included(base)
    base.class_eval do
      include B, A
    end
  end
end

class MyClass
  include Events
end

binding.pry