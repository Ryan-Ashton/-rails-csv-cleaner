require 'csv'
require 'tempfile'
# >>>>>>> 3d87afd5dfaaeb5964e6e3aa2f6d04d6e247e892

class FileConverter

  def initialize(file)
    @csv_blob = file
    @temp_file = Tempfile.new('foo.csv')
  end

  ##########################################################

  def missing_random_data
    begin
    clean = CSV.parse(@csv_blob.download, headers: true, skip_blanks: true).delete_if { |row| row.to_hash.values.all?(&:nil?) }

    lines = []

    clean = clean.to_a

    header = clean[0]

    counter = 0

    clean.each do |row|
      if counter == 0
        lines << header
        counter += 1
      else
        lines << row
        counter += 1
      end
    end

    CSV.open(@temp_file, 'wb') do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return @temp_file

    rescue Exception => e
      puts e
      return false
    end
  end

  #########################################################

  def header_spaces
    begin
    csv_options = { col_sep: ',', quote_char: '"' }

    lines = []

    CSV.parse(@csv_blob.download, csv_options) do | row |
      lines << row.map { |e| e.gsub(/ +?/, '') }
    end

    CSV.open(@temp_file, 'wb') do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return @temp_file

    rescue Exception => e
      puts e
      return false
    end
  end

  #####################################################

  def remove_new_lines
    begin
    csv_options = { col_sep: ',', quote_char: '"' }

    lines = []

    CSV.parse(@csv_blob.download, csv_options) do | row |
      lines << row.map { |e| e.gsub(/[\n\r +?]/, '') }
    end

    CSV.open(@temp_file, 'wb') do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return @temp_file

    rescue Exception => e
      puts e
      return false
    end
  end

  ########################################################

  def remove_symbols
    begin
    csv_options = { col_sep: ',', quote_char: '"' }
    lines = []

    CSV.parse(@csv_blob.download, csv_options) do | row |
      lines << row.map! { |e| e.gsub(/[^A-Za-z]+/, '')}
    end

    CSV.open(@temp_file, 'wb') do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return @temp_file

    rescue Exception => e
      puts e
      return false
    end
  end

  #######################################################

  def white_space_left_right
    begin
    csv_options = { col_sep: ',', quote_char: '"' }

    lines = []

    CSV.parse(@csv_blob.download, csv_options) do | row |
      lines << row.map { |e| e.gsub(/ +?/, '') }
    end

    CSV.open(@temp_file, 'wb') do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return @temp_file

    rescue Exception => e
      puts e
      return false
    end
  end

  #######################################################


    def remove_blank_columns
      begin
      csv_options = { col_sep: ',', quote_char: '"' }

      lines = []

      CSV.parse(@csv_blob.download, csv_options) do | row |
        row = row.compact!
        lines << row
      end

      CSV.open(@temp_file, 'wb') do |csv|
        lines.each do |line|
          csv << line
        end
      end

      return @temp_file

      rescue Exception
        return false
      end
    end

    ##################################################

    def over_under
      begin

      csv_options = { col_sep: ',', quote_char: '"' }
    
      arr1 = []
      arr2 = []
      lines = []
      counter = 1
      
    
      CSV.parse(@csv_blob.download, csv_options) do | row |  
        
        if counter.even? 
            arr1 << row
          else
            arr2 << row
        end
          counter += 1
      end
    
      
      splitter = 0
    
      arr2.length.times do
        if splitter == 0
          lines << arr2[0]
          splitter += 1
        else 
          lines << arr1[splitter.to_i] + arr2[splitter.to_i]
        end
      end
      
    
      csv_data = CSV.open(@temp_file, 'wb') do |csv|
        lines.each do |line|
          csv << line
        end
      end

      return @temp_file

    rescue Exception
      return false
    end
  end

    ###############################################

    def shared_column
      begin

      csv_options = { col_sep: ',', quote_char: '"' }
    
      lines = []
    
      CSV.parse(@csv_blob.download, csv_options) do | row |
        lines << row.map! { |e| e.split(",") }
      end
    
      csv_data = CSV.open(@temp_file, 'wb') do |csv|
        lines.each do |line|
          line.each do |l|
          csv << l
          end
        end
      end

      return @temp_file

    rescue Exception
      return false
    end
  end

end



