require 'fileutils'

namespace :rich do
  desc "Re-generate image styles"
  task :refresh_assets => :environment do
    # re-generate images
    ENV['CLASS'] = "Rich::RichFile"
    Rake::Task["paperclip:refresh"].invoke
    
    # re-generate uri cache
    Rich::RichFile.find_each(&:save)
  end
end