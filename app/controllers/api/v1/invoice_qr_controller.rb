# frozen_string_literal: true

module Api
  module V1
    class InvoiceQrController < Api::ApplicationController
      def create
        @invoice = Invoice.find(params[:id])

        unless @invoice.qr_code.attached?

          qrcode = RQRCode::QRCode.new(@invoice.cfdi_digital_stamp)

          png = qrcode.as_png(
            bit_depth: 1,
            border_modules: 4,
            color_mode: ChunkyPNG::COLOR_GRAYSCALE,
            color: 'black',
            file: nil,
            fill: 'white',
            module_px_size: 6,
            resize_exactly_to: false,
            resize_gte_to: false,
            size: 150
          )

          File.binwrite("#{Rails.root}/tmp/qrcode-invoice-#{@invoice.id}.png", png.to_s)

          @invoice.qr_code.attach(io: File.open("#{Rails.root}/tmp/qrcode-invoice-#{@invoice.id}.png"),
                                  filename: "qrcode-invoice-#{@invoice.id}.png", content_type: 'image/png')

        end

        render json: { invoice_qrcode_url: "#{@invoice.qr_code.service_url}" }.to_json, status: :ok
      end
    end
  end
end
