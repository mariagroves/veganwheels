class OrderItemsHelperTest < ActionView::TestCase
    require 'test_helper'
    test "tests that the method #get_duplicates returns correct duplicates" do
        cart = carts(:one)
        order_item = order_items(:two)
        order_item_duplicate = order_items(:three)

        assert_equal [order_item_duplicate], get_duplicates(order_item, cart)
    end

    test "test that the method #get_unique returns a filtered cart" do
        cart = carts(:one)
        assert_equal [order_items(:one), order_items(:two), order_items(:four)], get_unique(cart)
    end
end