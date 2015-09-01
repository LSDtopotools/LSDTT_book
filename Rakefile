namespace :book do
  desc 'prepare build'
  task :prebuild do
    Dir.mkdir 'images' unless Dir.exists? 'images'
    Dir.glob("book/*/images/*").each do |image|
      FileUtils.copy(image, "images/" + File.basename(image))
    end
  end

  desc 'build basic book formats'
  task :build => :prebuild do
    puts "Converting to HTML..."
    `bundle exec asciidoctor NMDM.asc`
    puts " -- HTML output at NMDM_book.html"

    puts "Converting to EPub..."
    `bundle exec asciidoctor-epub3 NMDM.asc`
    puts " -- Epub output at NMDM_book.epub"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor-pdf NMDM.asc`
    puts " -- PDF  output at NMDM_book.pdf"
  end
end

task :default => "book:build"
