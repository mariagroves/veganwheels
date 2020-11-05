class AddMoreInformationtoBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :faqs, :text
    add_column :businesses, :privacy, :text
    add_column :businesses, :terms, :text
  end
end
