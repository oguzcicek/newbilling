class OrderController < ApplicationController
  before_action :get_companies, only: [:new, :create]
  respond_to :html, :json

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create order_params

    if @order.save
      redirect_to order_index_path
    else
      render 'new', locals: { errors: @order.errors.full_messages }
    end
  end

  def bulk_order
    OrderGenerator.generateRandomOrders 100
    redirect_to order_index_path
  end

  def delete_all_orders
    Order.delete_all
    redirect_to root_path
  end


  def reports
    @total_amounts_affiliates = ReportGenerator.total_amount_report_of_affiliates
    @total_amounts_resellers = ReportGenerator.total_amount_report_of_resellers
    @profit_from_affilates = ReportGenerator.profit_report_of_affiliates
    @profit_from_resellers = ReportGenerator.profit_report_of_resellers
    @total_revenue = ReportGenerator.total_revenue_report

    respond_with(@total_amounts_affiliates,@total_amounts_resellers)
  end

  def order_params
    params.require(:order).permit(:quantity,:company_id)
  end

  private
  def get_companies
    @companies = Company.all
  end


end
