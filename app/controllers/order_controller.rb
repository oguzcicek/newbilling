class OrderController < ApplicationController
  before_action :get_companies, only: [:new, :create]

  # GET /order
  # GET /order.json
  api :GET ,'orders','This is the index view for all orders'
  def index
    @orders = Order.all
    respond_with(@orders)
  end

  # GET /
  api :GET ,' ','Root Page. You can generate/delete orders (one or bulk)'
  def new
    @order = Order.new
  end

  # POST /order
  api :POST ,'orders', 'Create orders manually'
  def create
    @order = Order.create order_params
    if @order.save
      redirect_to order_index_path
    else
      render 'new', locals: { errors: @order.errors.full_messages }
    end
  end

  # POST /bulk_order
  api :POST ,'bulk_order', 'Generate 100 randomized orders'
  def bulk_order
    OrderGenerator.generateRandomOrders 100
    redirect_to order_index_path
  end

  # DELETE /delete_all_orders
  api :DELETE ,'delete_all_orders', 'Delete all orders'
  def delete_all_orders
    Order.delete_all
    redirect_to root_path
  end

  # GET /reports
  # GET /reports.json
  api :GET ,'reports', 'Generate 3 Types of Reports'
  def reports
    @total_amounts_affiliates = ReportGenerator.total_amount_report_of_affiliates
    @total_amounts_resellers = ReportGenerator.total_amount_report_of_resellers
    @profit_from_affilates = ReportGenerator.profit_report_of_affiliates
    @profit_from_resellers = ReportGenerator.profit_report_of_resellers
    @total_revenue = ReportGenerator.total_revenue_report

    # for the json response
    respond_with([{ 'total_amounts_affiliates': @total_amounts_affiliates ,
                              'total_amounts_resellers': @total_amounts_resellers,
                              'profit_from_affilates': @profit_from_affilates,
                              'profit_from_resellers': @profit_from_resellers,
                              'total_revenue': @total_revenue,
                          }])
  end

  def order_params
    params.require(:order).permit(:quantity,:company_id)
  end

  private
  def get_companies
    @companies = Company.all
  end


end
