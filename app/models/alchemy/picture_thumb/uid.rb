# frozen_string_literal: true

require_dependency "alchemy/picture_thumb"

class Alchemy::PictureThumb::Uid
  # Returns a image variant uid for storage
  #
  # @param [String]
  # @param [Alchemy::PictureVariant]
  #
  # @return [String]
  def self.call(signature, variant)
    picture = variant.picture
    filename = variant.image_file_name || "image"
    name = File.basename(filename, ".*").gsub(/[^\w.]+/, "_")
    ext = variant.render_format

    "pictures/#{picture.id}/#{signature}/#{name}.#{ext}"
  end
end
