class Features < ApplicationService
  # You need to be ensure that folder has such file and columns in file dublicates fields in db:

  require 'roo'

  # need to enter classname to load corresponding file
  def initialize(char_class)
    @ods = Roo::Spreadsheet.open(path(char_class))
  end

  # return array of hashes witch are ready to create feautures in db
  def call
    @ods.sheet(0).parse(header_search: ['level'])
  end

  # adds classname to path:
  def path(char_class)
    "./public/tables/features/#{char_class}.ods"
  end
end
