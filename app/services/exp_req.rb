class ExpReq < ApplicationService
  # return array of hashes witch are ready to create table in db
  def call
    doc = Roo::Spreadsheet.open('public/tables/other/exp_req.xlsx')
    doc.sheet(0).parse(header_search: ['level'])
  end
end
