# Create classes that will apply scripting when called from controller

# The algorithm will be selected by its :id

# Once called it will perform the cleaning

require 'csv'

# file_path = 'MissingRandomData.csv'

Class TruncateData

  def missing_random_data(file_path)
    clean = CSV.parse(IO.read(file_path), headers: true, skip_blanks: true).delete_if { |row| row.to_hash.values.all?(&:nil?) }
    return clean
  end

end