class CustomersController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", only: :index

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find_by_id(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customer_path(@customer)
    else
      @error = @customer.errors.full_messages.first
      render :new
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :mobile, :email, :address, :city , :pincode , :cibil_report, :cibil_score, :good_time_to_call, :remarks)
    end

end
