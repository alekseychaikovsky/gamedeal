namespace :search_reddit do
  desc "DOIT"
  task :perform => :environment do
    SearchReddit.new.perform
  end
end
