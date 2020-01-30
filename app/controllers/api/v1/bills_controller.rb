class Api::V1::BillsController < Api::V1::Controller
  def generate
    unless Date.valid_date?(params["year"].to_i, params["month"].to_i, 1)
      raise I18n.t('activerecord.messages.bill.error.invalid_date')
    end

    data = BillService.generate({
      user: current_user.id,
      month: params["month"],
      year: params["year"]
    })

    render(
      status: 200,
      json: { result: data }
    )
  rescue Exception => msg
    render json: {
      status: :forbidden,
      errors: [
        {
          message: msg.to_s,
          status: 403
        }
      ]
    }
  end
end
