# frozen_string_literal: true

module Api
  module V1
    class InvoicesController < Api::ApplicationController
      before_action :set_invoice, only: %i[update destroy]

      # GET /invoices
      def index
        invoices = @current_api_user.invoices
        render json: { total_amount: retrieve_total_amount(invoices),
                       invoices: }, status: :ok
      end

      # POST /invoices
      def create
        invoice = Invoice.create(
          status: params[:status],
          emitter: params[:emitter],
          receiver: params[:receiver],
          amount: params[:amount],
          emitted_at: Time.zone.now,
          user_id: @current_api_user.id
        )

        render json: invoice, status: :ok
      end

      # PATCH/PUT /invoices/1
      def update
        if @invoice.update(
          status: params[:status],
          emitter: params[:emitter],
          receiver: params[:receiver],
          amount: params[:amount],
          emitted_at: params[:emitted_at],
          user_id: params[:user_id]
        )
          render json: @invoice, status: :ok
        else
          render json: @invoice.errors, status: :unprocessable_entity
        end
      end

      # DELETE /invoices/1
      def destroy
        @invoice.destroy
        render json: { results: 'Invoice Deleted' }.to_json, status: :ok
      end

      def search_amount_criteria
        filter_invoices_data = Invoice.where(
          status: params[:status],
          emitter: params[:emitter],
          receiver: params[:receiver],
          amount: params[:minimum_amount]..params[:maximum_amount],
          user_id: @current_api_user.id
        )

        render json: { invoices: filter_invoices_data }.to_json, status: :ok
      end

      def search_provider_criteria
        # byebug

        catch_date = params[:emitted_at].split('/')
        issue_date = Date.new(catch_date[2].to_i, catch_date[1].to_i, catch_date[0].to_i)
        start_issue_date = issue_date.in_time_zone('Tijuana').beginning_of_day
        end_issue_date = issue_date.in_time_zone('Tijuana').end_of_day

        filter_invoices_data = Invoice.where(
          emitter: params[:emitter],
          emitted_at: start_issue_date..end_issue_date,
          user_id: @current_api_user.id
        )

        render json: {  total_amount: retrieve_total_amount(filter_invoices_data),
                        invoices: filter_invoices_data }.to_json, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_invoice
        @invoice = Invoice.find(params[:id])
      end

      def retrieve_total_amount(invoices)
        amount = ActionController::Base.helpers.number_to_currency((invoices.sum(:amount) / 100), unit: '$ ',
                                                                                                  separator: ',', delimiter: '.')
      end
    end
  end
end
