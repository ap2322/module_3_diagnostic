class HarryPotterService
  def initialize
    conn
  end

  def find_order_member(house)
    response = conn.get('characters/') do |req|
      req.params['key'] = ENV['POTTER_API']
      req.params['house'] = house
      req.params['orderOfThePhoenix'] = 'true'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url: 'https://www.potterapi.com/v1/') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
