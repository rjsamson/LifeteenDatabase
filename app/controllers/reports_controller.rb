ReportsController < ApplicationController
  def example_report
    output_format = "PDF"
    report_unit = "/example/my-report"
    report_params = params[:report_params] # this should be a Hash!

    client = JasperServer::Client.new("http://example.com/jasperserver/services/repository",
                                      "jasperadmin", "secret!")
    request = JasperServer::ReportRequest.new(report_unit, output_format, report_params)
    pdf_data = client.request_report(request)

    filename = params[:action]+" on "+Time.now.iso8601+"."+format.downcase
    send_data(pdf_data, :type => Mime::Type.lookup_by_extension(output_format.downcase), 
              :disposition => 'inline', :filename => filename)
  end
end