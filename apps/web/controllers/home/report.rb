require 'google_drive'

module Web::Controllers::Home
  class Report
    include Web::Action

    def call(params)
      puts params.inspect
      address = params[:address]

      # Creates a session. This will prompt the credential via command line for the
      # first time and save it to config.json file for later usages.
      session = GoogleDrive::Session.from_service_account_key("google_account.json")

      ws = session.spreadsheet_by_key("1W3MWQA5_aFsjBjkaY0_qbXLkUcoOg6bD3gxZ4802mJA").worksheets[1]

      max_row = ws.num_rows + 1

      ws[max_row, 1] = address[:full]
      ws[max_row, 2] = address[:postcode]
      ws[max_row, 3] = address[:city]
      ws[max_row, 4] = address[:district]
      ws[max_row, 5] = address[:subdistrict]
      ws[max_row, 6] = address[:neighborhood]
      ws[max_row, 7] = address[:street]
      ws[max_row, 8] = address[:xiang]
      ws[max_row, 9] = address[:nong]
      ws[max_row, 10] = address[:housenumber]
      ws.save
    end
  end
end
