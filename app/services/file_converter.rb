require 'csv'
require 'pry-byebug'

class FileConverter < ApplicationService

  def initialize(file)
    @file = file
  end

  # Remove symbol algorithm
  def algorithm_1
    csv_options = { col_sep: ',', quote_char: '"' }
    lines = []

    CSV.foreach(@file, csv_options) do | row |
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

end
