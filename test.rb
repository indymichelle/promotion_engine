require 'rspec/autorun'
require_relative './../code_test/promotion_engine.rb'

describe PromotionEngine do
    let(:prices) { {'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15} }
    let (:promotions) do {
        {'A' => 3} => 130,
        {'B' => 2} => 45,
        {'C' => 1, 'D' => 1} => 30
    }
    end
    let(:promotion_engine) { PromotionEngine.new(prices, promotions)}

  it 'calculates Scenario A correctly' do
    expect(promotion_engine.calculate_price({'A' => 1,'B' => 1, 'C' => 1})).to eq(50 + 30 + 20)
  end

  it 'calculates Scenario B correctly' do
    expect(promotion_engine.calculate_price({'A' => 5,'B' => 5, 'C' => 1})).to eq(230 + 120 + 20)
  end

  it 'calculates Scenario c correctly' do
    expect(promotion_engine.calculate_price({'A' => 3,'B' => 5, 'C' => 1, 'D' => 1})).to eq(130 + 120 + 30)
  end

  it 'handles empty hash' do
    expect(promotion_engine.calculate_price({})).to eq(0)
  end
end