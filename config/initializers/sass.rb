Kabupaten::Application.configure do
  config.sass.load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/compass/stylesheets"
  config.sass.load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/blueprint/stylesheets"

  config.sass.line_comments = false
  config.sass.style = :nested
end