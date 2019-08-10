#app/services/report_genarator.rb

class ReportGenerator

  class << self


    # Report Generator Service
    # Service returns
    #
    # to easily show reports in html i return hashes. If we need to use REST , i can convert them to Json (with .to_json)


    ## REPORT 1

    def total_amount_report_of_affiliates
      get_affiliates_resellers
      affiliates_total_amounts = []
      @affiliates.each do |a|
        affiliates_total_amounts  <<  {
            name: a.name,
            total: a.orders.from_this_month.sum(&:quantity),
            amount: a.orders.from_this_month.sum(&:quantity) * a.payment_method.sell_price
        }
      end
       affiliates_total_amounts
    end

    def total_amount_report_of_resellers
      get_affiliates_resellers
      resellers_total_amounts = []
      @resellers.each do |a|
        resellers_total_amounts  <<  {
            name: a.name,
            total: a.orders.from_this_month.sum(&:quantity),
            amount: a.orders.from_this_month.sum(&:quantity) * a.payment_method.sell_price
        }
      end
       resellers_total_amounts
    end


    ## REPORT 2
    def profit_report_of_affiliates
      get_affiliates_resellers
      affiliates_profits = []
      @affiliates.each do |a|
        affiliates_profits <<  {
            name: a.name,
            total: a.orders.from_this_month.sum(&:quantity),
            amount: self.affiliates_condition(a.orders.from_this_month.sum(&:quantity), a.payment_method.sell_price ),
        }
      end
       affiliates_profits
    end


    def profit_report_of_resellers
      get_affiliates_resellers
      resellers_profits = []
      @resellers.each do |a|
        resellers_profits <<  {
            name: a.name,
            total: a.orders.from_this_month.sum(&:quantity),
            amount: self.resellersCalculation(a.orders.sum(&:quantity), a.payment_method.sell_price )
        }
      end
       resellers_profits
    end


    #REPORT 3
    def total_revenue_report
      @orders =  Order.from_this_month
      total_revenue = 0
      @orders.each do |a|
        total_revenue +=  a.quantity * a.company.payment_method.sell_price
      end
       total_revenue
    end

    def get_affiliates_resellers
      @affiliates = Company.where(payment_method_id: PaymentMethod.where(method: 'tiered') )
      @resellers = Company.where(payment_method_id: PaymentMethod.where(method: 'flat') )
    end

    def affiliates_condition(sum , sell_price)
      if sum < 500
        sum * (sell_price - 60)
      elsif  sum >500  and  sum < 1001
        sum * (sell_price - 50)
      elsif sum > 1000
        sum * (sell_price - 40)
      end
    end


    def resellersCalculation(sum , sell_price)
      sum * (sell_price - 50)
    end

  end
end