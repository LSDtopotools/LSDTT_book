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

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor-pdf LSDTT_docs.asc`
    puts " -- PDF  output at LSDTT_book.pdf"
  end

  desc 'build html only'
  task :build_html => :prebuild do
    puts "Converting to HTML..."
    `bundle exec asciidoctor LSDTT_docs.asc`
    puts " -- HTML output at LSDTT_book.html"
  end  
    
    desc 'build html with github stylesheet'
  task :build_html_gitcss => :prebuild do
      puts "Converting to HTML with github stylesheet..."
      `bundle exec asciidoctor LSDTT_docs.asc -a stylesheet=github.css -a stylesdir=./stylesheets -o index.html`
      puts " -- HTML output at index.html"
  end      
end



task :default => "book:build"
