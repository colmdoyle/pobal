namespace :whoismytd do
  desc "TODO"
  task :old_records => :environment do
    require 'csv'
    csv_text = File.read('Representative.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Person.create!(row.to_hash)
    end
  end
end
