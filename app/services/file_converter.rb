require 'csv'

class FileConverter

  def initialize(file)
    @csv_blob = file
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

    csv_data = CSV.generate(headers: :first_row) do |csv|
      lines.each do |line|
        csv << line
      end
    end

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

    csv_data = CSV.generate(headers: true) do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return csv_data

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

    csv_data = CSV.generate(headers: true) do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return csv_data

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

    csv_data = CSV.generate(headers: true) do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return csv_data

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

    csv_data = CSV.generate(headers: true) do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return csv_data

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

      csv_data = CSV.generate(headers: true) do |csv|
        lines.each do |line|
          csv << line
        end
      end

      return csv_data

      rescue Exception
        return false
      end
    end

  end



