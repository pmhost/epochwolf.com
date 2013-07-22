task :default => [:watch]

def port_open?(ip, port, seconds=1)
  require 'socket'
  require 'timeout'

  Timeout::timeout(seconds) do
    begin
      TCPSocket.new(ip, port).close
      true
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
      false
    end
  end
rescue Timeout::Error
  false
end

desc "Builds the site"
task :build do 
  print "Building website...\r"
  $stdout.flush

  txt = `middleman build --clean`

  if $?.success?
    puts "Building website [OK]"
  else
    puts "Building website [FAIL]"
    puts txt
  end
end

desc "Deploys the site to the server"
task :deploy do 
  print "Deploying website...\r"
  $stdout.flush

  txt = `rsync --recursive --links --verbose --rsh=ssh --delete build/ kazan:/srv/blog/`

  if $?.success?
    puts "Deploying website [OK]"
  else
    puts "Deploying website [FAIL]"
    puts txt
  end
end

desc "Launches a live preview on localhost:4567" 
task :preview do 
  system "middleman server"
end

desc "Check for broken links (requires a preview server to be running)"
task :test do 
  print "Checking for broken links...\r"
  $stdout.flush

  if port_open? "127.0.0.1", "4567"
    txt = `wget -e robots=off --spider -r -l 8 http://localhost:4567 2>&1`
    if $?.success?
      puts "Checking for broken links [OK]"
    else
      puts "Checking for broken links [FAIL]"
      puts ""
      puts "The following links aren't navigable."
      puts txt.lines.select{|l| l =~ %r"^http://localhost:4567/" }.join "\n"
    end
  else
    puts "Checking for broken links [FAIL]"
    puts "Please start a preview server."
  end
end

def prompt(message, default=nil)
  message_end = default ? " [#{default}]:" : ":"
  print("#{message}#{message_end} ")
  if (str = $stdin.gets.chomp) == ""
    default
  else
    str
  end
end

def create_file(folder, title, options={})
  options[:title] = title
  options[:date] ||= Date.today
  options[:tags] = (options[:tags] || "").split(/\s+,\s+/).map{|s| s.downcase.gsub(/\W+/, '-') }
  options.delete(:tags) if options[:tags].empty?
  options[:date] = options[:date].strftime "%Y-%m-%d"

  slug = options[:title].downcase.gsub(/\W+/, '-')
  filename = File.join folder, "#{options[:date]}-#{slug}.markdown"

  raise "File exists!" if File.exists? filename
  File.open(filename, 'w') do |io|
    io.puts "---"
    io.puts "link: #{options.delete(:link)}" if options[:link]
    io.puts "title: #{options.delete(:title)}"
    io.puts "date: #{options.delete(:date)}"
    if tags = options.delete(:tags)
      io.puts "tags:"
      tags.each do |tag|
        io.puts "  - #{tag}"
      end
    end
    options.each do |k, v|
      io.puts "#{k}: #{v.inspect}"
    end
    io.puts "---"
    io.puts ""
    io.puts 'TEXT-GOES-HERE'
  end
  return filename
end

namespace :new do 
  task :post do 
    title = prompt "Title for post", "New Post"
    date  = Date.parse(prompt("Date for post", Date.today.strftime("%Y-%m-%d")))
    tags  = prompt "Tags for post (comma separated)"

    filename = create_file "source/blog", title, date: date, tags: tags
    puts "New post at #{filename}"
  end

  task :link do
    link  = prompt "Link for post", "/404"
    title = prompt "Title for post", "New Post"
    date  = Date.parse(prompt "Date for post", Date.today.strftime("%Y-%m-%d"))
    tags  = prompt "Tags for post (comma separated)"

    create_file "source/blog", link: link, date: date, tags: tags
  end

  task :story do 
    title = prompt "Title for story", "New Story"
    date  = Date.parse(prompt "Date for story", Date.today.strftime("%Y-%m-%d"))
    tags  = prompt "Tags for story (comma separated)"

    create_file "source/writing", date: date, tags: tags
  end
end