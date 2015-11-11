namespace :people_import do
  desc "Import People into the system"
  task :old_records => :environment do
    require 'csv'
    csv_text = File.read('people.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Person.create!(row.to_hash)
    end
  end
end
