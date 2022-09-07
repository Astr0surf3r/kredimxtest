# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # AUTHENTICATION
      post 'authenticate', to: 'authentication#authenticate'
      # INVOICES
      resources :invoices
      get 'amount-range', to: 'invoices#search_amount_criteria'
      get 'issue-date', to: 'invoices#search_provider_criteria'
      # QR CODE INVOICE
      post 'qrcode-invoice/:id', to: 'invoice_qr#create'
      # UPLOAD INVOICE
      post 'process-invoices/', to: 'invoice_upload#create'
    end
  end
end
