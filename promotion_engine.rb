class PromotionEngine
  attr_reader :prices, :promotions

  def initialize(prices, promotions)
    @prices = prices
    @promotions =  promotions
  end

  def calculate_price(items)
    @total = 0
    apply_promotions(items)
    calculate_single_item_prices
    @total
  end

  def apply_promotions(items)
    @remaining_items = items

    @promotions.each do |sku_hash, price|
      loop do
        apply_promotion = sku_hash.all? do |sku, count|
          (@remaining_items[sku] || 0) >= count
        end
        if apply_promotion
          @total += price
          sku_hash.each do |sku, count|
            @remaining_items[sku] -= count
          end
        else
          break
        end
      end
    end
  end

  def calculate_single_item_prices
    @prices.each do |sku, cost|
      @total += (@remaining_items[sku] || 0) * cost
    end
  end
end