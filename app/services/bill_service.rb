class BillService
  def self.generate(params)
    user_id, month, year = params.values
    total_value = 0

    bills = Lend.from_user(user_id).from_month(month).from_year(year).not_active.map do |lend|
      current_value = calc_value(lend.start_at, lend.end_at)
      total_value += current_value

      {
        bike: lend.bike.to_s,
        origin: lend&.last_lend&.station&.to_s,
        destiny: lend.station.to_s,
        distance: lend.distance,
        start_at: I18n.l(lend.start_at),
        end_at: I18n.l(lend.end_at),
        value: 'R$ ' + current_value.to_s,
      }
    end

    {
      bills: bills,
      total_value: total_value.round(2),
      user: User.find(user_id).to_s,
      reference: I18n.l(Date.new(year.to_i, month.to_i, 1), format: :competence),
    }
  end

  def self.calc_value(start_at, end_at)
    lend_value = ENV['LEND_VALUE'].present? ? ENV['LEND_VALUE'].to_f : 0.20
    minutes = ((end_at - start_at) / 1.minutes).to_i

    [(((minutes - 60) / 5).to_i * lend_value), 0].max
  end
end
