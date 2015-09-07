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
    `bundle exec asciidoctor LSDTT_docs.asc`
    puts " -- HTML output at LSDTT_book.html"

    puts "Converting to EPub..."
    `bundle exec asciidoctor-epub3 LSDTT_docs.asc`
    puts " -- Epub output at LSDTT_book.epub"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor-pdf LSDTT_docs.asc`
    puts " -- PDF  output at LSDTT_book.pdf"
  end
end

task :default => "book:build"
