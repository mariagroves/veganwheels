require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "test that the cart subtotal is returned correctly" do
    assert_equal 3700, carts(:one).get_subtotal
  end

  test "test that the cart total is returned correctly" do
    assert_equal 3800, carts(:one).get_total
  end

  test "test that the quantity is returned correctly" do
    assert_equal 5, carts(:one).get_quantity
  end

  test "test that restaurant name returned" do
    assert_equal restaurants(:one), carts(:one).restaurant
  end

  test "test that carts which are below the minimum spend are identified" do
    assert_equal false, carts(:one).is_below_minimum_spend
  end
end
