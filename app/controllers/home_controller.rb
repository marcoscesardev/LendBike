class HomeController < ApplicationController
  def index
    @lends_vacancies =
      Lend.current.group_by(&:station).map do |station, lend|
        {
          station: station.name,
          vacancies_percentage: ((lend.size.to_f / station.vacancies) * 100).round,
          lend_size: lend.size,
          station_vacancies: station.vacancies,
        }
      end.sort_by { |station| station[:vacancies_percentage] }.reverse.first(5)
  end
end
