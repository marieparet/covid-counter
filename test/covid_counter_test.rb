require_relative '../app/covid_counter'
require_relative 'test_helper'

class CovidCounterTest < Minitest::Test
  def setup
    stub_request(:get, "https://api.covid19api.com/world/total").
    to_return(status: 200, body: "{\"TotalConfirmed\":2142221,\"TotalDeaths\":168885,\"TotalRecovered\":1005926}\n")
  end

  def test_total_confirmed_works
    assert_equal CovidCounter.total_confirmed, 2142221
  end

  def test_total_deaths_works
    assert_equal CovidCounter.total_deaths, 168885
  end

  def test_total_recovered_works
    assert_equal CovidCounter.total_recovered, 1005926
  end

  def test_returns_nil_when_api_is_down
    stub_request(:get, "https://api.covid19api.com/world/total").
    to_return(status: 504)
    assert_nil CovidCounter.total_recovered
  end
end
