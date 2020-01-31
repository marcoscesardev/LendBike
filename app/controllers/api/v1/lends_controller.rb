class Api::V1::LendsController < Api::V1::Controller
  def get_bike
    bike = Bike.find_by_code(params['bike_code'])

    raise I18n.t('activerecord.errors.models.lend.messages.bike_code_invalid') if bike.blank?

    lend = Lend.create!(
      user_id: current_user.id,
      bike_id: bike&.id,
      start_at: Time.current
    )

    render(
      status: 200,
      json: { lend: lend.attributes }
    )
  rescue Exception => msg
    render json: {
      status: :forbidden,
      errors: [
        {
          message: msg.to_s,
          status: 403,
        },
      ],
    }
  end

  def leave_bike
    station = Station.find_by_code(params['station_code'])

    raise I18n.t('activerecord.errors.models.lend.messages.station_code_invalid') if station.blank?

    lend = current_user.lend

    raise I18n.t('activerecord.errors.models.lend.messages.user_without_lend_active') if lend.blank?

    lend.update!(
      distance: params['distance']&.to_i,
      end_at: Time.current,
      station_id: station.id
    )

    render(
      status: 200,
      json: { lend: lend.attributes }
    )
  rescue Exception => msg
    render json: {
      status: :forbidden,
      errors: [
        {
          message: msg.to_s,
          status: 403,
        },
      ],
    }
  end
end
