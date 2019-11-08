require 'csv'
require 'pry-byebug'

class FileConverter < ApplicationService

  def initialize(file)
    @csv_blob = file
  end

  # Remove symbol algorithm
  def algorithm_1
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

    return false unless csv_data
    csv_data
  end

  #######################################################

  def header_spaces

    csv_options = { col_sep: ',', quote_char: '"' }

    lines = []

    CSV.foreach(@file, csv_options) do | row |
      lines << row.map { |e| e.gsub(/ +?/, '') }
    end

    csv_data = CSV.generate(headers: true) do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return false unless csv_data
    csv_data
  end



  #######################################################

  def remove_new_lines

    csv_options = { col_sep: ',', quote_char: '"' }

    lines = []

    CSV.foreach(@file, csv_options) do | row |
      lines << row.map { |e| e.gsub(/[\n\r +?]/, '') }
    end

    csv_data = CSV.generate(headers: true) do |csv|
      lines.each do |line|
        csv << line
      end
    end

    return false unless csv_data
    csv_data
  end

    #######################################################

    def remove_blank_columns

      csv_options = { col_sep: ',', quote_char: '"' }

      lines = []

      CSV.foreach(@file, csv_options) do | row |
        row = row.compact!
        lines << row
      end

      csv_data = CSV.generate(headers: true) do |csv|
        lines.each do |line|
          csv << line
        end
      end

      return false unless csv_data
      csv_data
    end

    #######################################################

    def white_space_left_right

      csv_options = { col_sep: ',', quote_char: '"' }

      lines = []

      CSV.foreach(@file, csv_options) do | row |
        lines << row.map { |e| e.gsub(/ +?/, '') }
      end

      csv_data = CSV.generate(headers: true) do |csv|
        lines.each do |line|
          csv << line
        end
      end

      return false unless csv_data
      csv_data
    end

    #######################################################

    def missing_random_data(file_path)
      clean = CSV.parse(IO.read(file_path), headers: true, skip_blanks: true).delete_if { |row| row.to_hash.values.all?(&:nil?) }
      
      lines = []
    
      clean.to_a
    
      clean.each do |row|
        lines << row
      end
    
      csv_data = CSV.generate(headers: true) do |csv|
        lines.each do |line|
          csv << line
        end
      end

      return false unless csv_data
      csv_data 
    end


end
