require 'open3'
require 'rake/clean'

CLEAN.include("output/**")

task(:default => [:rebuild])

desc("Clean output and recompile")
task(:rebuild => [:clean, :compile])

task(:view) do
  port = ENV.fetch("PORT", 3000)
  exec("bundle exec rackup config.ru -p #{port}")
end

task(:watch) do
  exec("bundle exec guard")
end

desc("Recompile output")
task(:compile) do
  output = `nanoc compile 2>&1`
  print output
  raise RuntimeError unless $?.success?
end

desc("Deploy current output directory to GH Pages")
task(:deploy) do
  timestamp = Time.now.getutc.strftime("%Y-%m-%d %H:%M:%S UTC")
  output = `cd output && git add -A . 2>&1 && git commit -m "Site updated at #{timestamp}" 2>&1 && git push 2>&1`
  print output
  raise RuntimeError unless $?.success?
end
