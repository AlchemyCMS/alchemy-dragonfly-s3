# frozen_string_literal: true

module Alchemy
  module PictureMonkeyPatch
    def self.prepended(klass)
      klass.has_many :thumbs, class_name: "Alchemy::PictureThumb", dependent: :destroy
      klass.after_create -> { PictureThumb.generate_thumbs!(self) }
    end

    # Returns an url (or relative path) to a processed image for use inside an image_tag helper.
    #
    # Any additional options are passed to the url method, so you can add params to your url.
    #
    # Example:
    #
    #   <%= image_tag picture.url(size: '320x200', format: 'png') %>
    #
    # @see Alchemy::PictureVariant#call for transformation options
    # @see Alchemy::Picture::Url#call for url options
    # @return [String|Nil]
    def url(options = {})
      return unless image_file

      variant = PictureVariant.new(self, options.slice(*Picture::TRANSFORMATION_OPTIONS))
      Picture::S3Url.new(variant).call(options.except(*Picture::TRANSFORMATION_OPTIONS).merge(
        basename: name,
        ext: variant.render_format,
        name: name,
      ))
    rescue ::Dragonfly::Job::Fetch::NotFound => e
      log_warning(e.message)
      nil
    end

    Picture::THUMBNAIL_SIZES = {
      small: "80x60",
      medium: "160x120",
      large: "240x180",
    }.with_indifferent_access.freeze

    Picture.prepend(self)
  end
end
