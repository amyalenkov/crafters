namespace :db do

  desc 'general task for prepare db'
  task :prepare_db => [:delete_all_data_from_db,
                       :add_data_to_category,
                       :add_data_to_subcategory]

  desc 'delete all data from tables Subcategory, Category'
  task :delete_all_data_from_db => :environment do
    [Subcategory,Category].each(&:delete_all)
  end

  desc 'add data to table category from csv'
  task :add_data_to_category => :environment do
    require 'csv'
    CSV.foreach('db/csv_files/category.csv') do |row|
      id, name = row[0].to_s.split(/;/)
      Category.create!(id: id, name: name)
    end
    end

  desc 'add data to table subcategory from csv'
  task :add_data_to_subcategory => :environment do
    require 'csv'
    CSV.foreach('db/csv_files/new_subcategory.csv') do |row|
      id, name, created_at, updated_at, category_id, title_sub_category = row[0].to_s.split(/;/)
      Subcategory.create!(id: id, name: name, category_id: category_id.to_i, title_sub_category: title_sub_category)
    end
  end


end