class Api::V1::MarketsController < Api::V1::BaseController
  def index
    astar_market_info = market_request('ASTARF_USDT')
    astar_market_info = astar_default_body if (astar_market_info["ticker"]["last_cny"] == "0.0" rescue true)
    @markets = []
    @markets << astar_market_info
    @markets << market_request('ETH_USDT')
    @markets << market_request('BTC_USDT')
    @markets << market_request('EOS_ETH')
    @markets << market_request('BCH_BTC')
    @markets << market_request('LTC_BTC')
  end

  def market_request(market)
    _request = Typhoeus::Request.new(
      "https://bitrabbit.com/api/v2/markets/#{market}.json",
      method: :get
    )
    JSON.parse _request.run.body
  end

  def astar_default_body
    {
      "id": 99,
      "name": "ASTARF/USDT",
      "ticker": {
        "low": "0.142857143",
        "high": "0.142857143",
        "last": "0.142857143",
        "open": "0.142857143",
        "volume": "0",
        "turnover": "0",
        "sell": "0.142857143",
        "buy": "0.142857143",
        "at": Time.current.to_i,
        "last_usdt": "0.142857143",
        "last_cny": "1"
      },
      "ask_config": {
        "fee_rate": "0.0",
        "price_minmov": "0.01",
        "min_amount": "0.000001"
      },
      "bid_config": {
        "fee_rate": "0.0",
        "price_minmov": "0.01",
        "min_amount": "0.000001"
      },
      "tags": [],
      "favorite": false
    }
  end
end
