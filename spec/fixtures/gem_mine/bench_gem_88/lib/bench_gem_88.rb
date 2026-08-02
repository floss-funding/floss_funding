# frozen_string_literal: true

module BenchGem88
  module Core; end
end

if ENV.fetch("GEM_MINE_GROUP_8", "0") != "0"
  require "floss_funding"
  BenchGem88::Core.send(:include, FlossFunding::Poke.new(__FILE__, namespace: "BenchGem88"))
end
