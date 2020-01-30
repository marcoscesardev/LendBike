class BillsController < ApplicationController
  before_action :load_params, only: [:new, :generate]

  def index
    redirect_to action: :new
  end

  def new; end

  def generate
    if params["report"].values.reject(&:blank?).size == 3
      @data = BillService.generate(params["report"])

      render :show
    else
      flash[:alert] = I18n.t('activerecord.messages.bill.error.missing_params')

      render :new
    end
  end

  def load_params
    @users = User.all
    @months = (1..12)
    @years = (Lend.first.created_at.year ..Date.current.year)
  end
end
