class CreateConfigurationDates < ActiveRecord::Migration
  
  def change
    create_table :configuration_dates do |t|
      t.integer  :user_id
      t.string   :configuration_date
      t.string   :sort_value
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
  
#  def self.up
#    execute <<-SQL
#      CREATE TABLE `configuration_dates` (
#        `id` int(11) NOT NULL AUTO_INCREMENT,
#        `user_id` int(11) DEFAULT NULL,
#        `configuration_date` char(10) DEFAULT NULL,
#        `sort_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
#        `created_at` datetime NOT NULL,
#        `updated_at` datetime NOT NULL,
#        PRIMARY KEY (`id`)
#      ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
#    SQL
#  end
  
#  def self.down
#    drop_table :configuration_dates
#  end
  
end
