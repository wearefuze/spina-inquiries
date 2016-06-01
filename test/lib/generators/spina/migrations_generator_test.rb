require 'test_helper'
require 'generators/migrations/migrations_generator'

module Spina
  class MigrationsGeneratorTest < Rails::Generators::TestCase
    tests MigrationsGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
