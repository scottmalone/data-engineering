class Upload < ActiveRecord::Base

  require "csv"

  attr_accessor :file_data
  attr_accessible :complete, :file_name, :file_data

  after_create :parse_data
  #after_save :update_complete

  def file_data=(data)
    tab_file_name = "#{File.basename(data.original_filename, ".*")}_#{Time.now.strftime('%Y%m%d%H%M%S%L')}.tab" 
    write_attribute(:file_name, tab_file_name)
    store_file(data) if data
  end

  def store_file(data)
    content = data.tempfile.read.force_encoding("UTF-8")
    File.open(file_path, "w+") do |f|
      f.write(content)
    end
  end

  def file_path
    File.join(Rails.root, "tmp", "downloads", file_name)
  end

  def parse_data
    Thread.new do
      table = CSV.read(file_path, { :headers => true, :col_sep => "\t", :skip_blanks => true })
      rows = table.to_a
      rows.delete_at(0)
      rows.each do |row|
        customer = Customer.where(
          :name => row[column_position("purchaser name")]
        ).first_or_create
        merchant = Merchant.where(
          :name => row[column_position("merchant name")],
          :address => row[column_position("merchant address")]
        ).first_or_create
        product = Product.where(
          :description => row[column_position("item description")],
          :price => row[column_position("item price")],
          :merchant_id => merchant.id
        ).first_or_create
        invoice = Invoice.where(
          :customer_id => customer.id
        ).first_or_create
        invoice_item = InvoiceItem.where(
          :invoice_id => invoice.id,
          :product_id => product.id,
          :quantity => row[column_position("purchase count")],
          :current_price => row[column_position("item price")]
        ).first_or_create
      end
      self.complete = true
      save
    end
  end

  def update_complete
     
  end

  def column_position(column)
    columns.index(column)
  end

  def columns 
    [
      "purchaser name",
      "item description",
      "item price",
      "purchase count",
      "merchant address",
      "merchant name"
    ]
  end  


end
