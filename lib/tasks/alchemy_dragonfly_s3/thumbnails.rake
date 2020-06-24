# frozen_string_literal: true

namespace :alchemy_dragonfly_s3 do
  namespace :thumbnails do
    desc "Regenerates missing thumbnails for Alchemy Pictures."
    task regenerate: :environment do
      puts "Regenerate missing thumbnails. Please wait...\n"
      Alchemy::Picture.find_each do |picture|
        Alchemy::PictureThumb.generate_thumbs!(picture)
        print "."
      end
      puts "\n Done!"
    end
  end
end
