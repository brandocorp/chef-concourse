
group :red_green_refactor, halt_on_fail: true do
  guard :rspec, cmd: 'rspec' do
    # Run recipe tests when they are updated
    watch(%r{^recipes/(?<path>.+)\.rb$}) { |m| "spec/unit/recipes/#{m[:path]}_spec.rb" }
    # Run resource tests when they are updated
    watch(%r{^resources/(?<path>.+)\.rb$}) { |m| "spec/unit/resources/#{m[:path]}/*_spec.rb" }
    # Run library tests when they are updated
    watch(%r{^libraries/(?<path>.+)\.rb$}) { |m| "spec/unit/libraries/#{m[:path]}_spec.rb" }

    # Run tests when they are updated
    watch(%r{^spec/unit/resources})
    watch(%r{^test/fixtures/cookbooks/test_concourse}) { "spec/unit/resources" }
  end

  guard :rubocop, cli: ['--lint'] do
    watch(%r{.*\.rb})
  end

  guard :shell do
    [
      %r{test/.+},
      %r{^recipes/(.+)\.rb$},
      %r{^attributes/(.+)\.rb$},
      %r{^files/(.+)},
      %r{^templates/(.+)},
      %r{^providers/(.+)\.rb},
      %r{^resources/(.+)\.rb},
      '(.*)\.kitchen.yml',
      '(.*)\.kitchen\.local\.yml'
    ].each do |pattern|
      watch(pattern) do
        system('kitchen test')
      end
    end
  end
end
