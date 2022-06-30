class PromotionEngine
  def calculate_price(sku_array)
    @price = 0
    apply_promotions(sku_array)
    calculate_single_item_prices
    @price
  end

  def apply_promotions(sku_array)
    promotion_1(sku_array)
    promotion_2(sku_array)
    promotion_3(sku_array)
  end

  def promotion_1(sku_array)
    @a_array_count = sku_array.select { |element| element if element == 'A' }.count

    return if @a_array_count.zero?

    while @a_array_count >= 3
      @price += 130
      @a_array_count -= 3
    end
    puts @price
  end

  def promotion_2(sku_array)
    @b_array_count = sku_array.select { |element| element if element == 'B' }.count

    return if @b_array_count.zero?

    while @b_array_count >= 2
      @price += 45
      @b_array_count -= 2
    end

    puts @price
  end

  def promotion_3(sku_array)
    @c_array_count = sku_array.select { |element| element if element == 'C' }.count
    @d_array_count = sku_array.select { |element| element if element == 'D' }.count

    return if @c_array_count.zero? || @d_array_count.zero?

    while @c_array_count >= 1
      break if @d_array_count == 0

      @price += 30
      @c_array_count -= 1
      @d_array_count -= 1
    end

    puts @price
  end

  def calculate_single_item_prices
    @price += @a_array_count * 50
    @price += @b_array_count * 30
    @price += @c_array_count * 20
    @price += @d_array_count * 15
  end

  def test_scenarios
    puts calculate_price(['A','B','C'])
    puts calculate_price(['A','A','A','A','A','B','B','B','B','B','C'])
    puts calculate_price(['A','A','A','B','B','B','B','B','C','D'])
  end
end
