class Thumbnailize < Nanoc::Filter
  identifier :thumbnailize
  type :binary

  def run(filename, options={})
    system(
      'convert',
      '-resize',
      options.fetch(:width).to_s,
      filename,
      output_filename
    )
  end
end

def photos
  @items.select do |i|
    i.identifier =~ %r{/files/images/photos/}
  end
end
