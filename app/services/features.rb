class Features < ApplicationService

  require 'roo'

  def initialize(char_class)
    @ods = Roo::Spreadsheet.open(path(char_class))
  end
  
  def call
    hash = @ods.sheet(0).parse(header_search: ['level'])
  end

  def path(key)
    return './public/tables/features/' + key + '.ods'
  end

end
