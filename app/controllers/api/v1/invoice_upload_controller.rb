# frozen_string_literal: true

module Api
  module V1
    class InvoiceUploadController < Api::ApplicationController
      def create
        @files = params[:files]
        begin
          files.each do |file|
            create_invoice(file)
          end

          render json: { info: 'invoices added to database' }.to_json, status: :ok
        rescue Exception => e
          Rails.logger.debug { "Something Went Wrong #{e}" }
          render json: { warning: "something went wrong' #{e}" }.to_json, status: :ok
        end
      end

      private

      def create_invoice(file)
        doc = Nokogiri::XML.parse(file)
        invoice = Invoice.find_or_create_by(
          invoice_uuid: doc.xpath('//invoice_uuid').text,
          emitsdsdter: doc.xpath('//emitter//name').text,
          emitter_rfc: doc.xpath('//emitter//rfc').text,
          receiver: doc.xpath('//receiver//name').text,
          receiver_rfc: doc.xpath('//receiver//rfc').text,
          amount: doc.xpath('//amount//cents').text.to_i,
          currency: doc.xpath('//amount//currency').text,
          emitted_at: doc.xpath('//emitted_at').text,
          expires_at: doc.xpath('//expires_at').text,
          signed_at: doc.xpath('//signed_at').text,
          cfdi_digital_stamp: doc.xpath('//cfdi_digital_stamp').text,
          user_id: @current_api_user.id
        )
      end
    end
  end
end
