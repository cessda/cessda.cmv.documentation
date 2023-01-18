require 'html-proofer'

task default: %w[lint]

task :lint do
  exec 'find . -name "*.md" | grep -v "^.\/vendor\/" | xargs mdl'
end

task :htmlproofer do
  options = {
   :only_4xx => true,
   :allow_hash_href => true,
   :ignore_urls => [
     "https://cmv.cessda.eu/",
     "api/javadoc/index.html",
     "../api/swagger",
     /\/profiles\/.+/
     ]
  }
  HTMLProofer.check_directory("./_site", options).run
end
