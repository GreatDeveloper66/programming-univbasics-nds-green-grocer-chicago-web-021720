require 'pry'

def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs

  collection.find do |element|
    element[:item] == name
  end
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  newcart = []
  cart.each do |food|
    record = newcart.find do |record|
      record[:item] == food[:item]
    end
    if record
      record[:count] += 1
    else
      newfood = food
      newfood[:count] = 1
      newcart << newfood
    end
  end
  newcart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |coupon|
    newcoupon = {}
    newcoupon[:item] = coupon[:item] + " W/COUPON"
    newcoupon[:count] = coupon[:num]
    newcoupon[:price] = (coupon[:cost]/coupon[:count]).round(2)
    olditem = find_item_by_name_in_collection(coupon[:item], cart)
    newcoupon[:clearance] = olditem[:clearance]
    cart[olditem[:item]][:count] = cart[olditem[:item]][:count] - newcoupon[:count]
    cart << newcoupon
  end
  cart
end

def apply_clearance(cart)

  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.map do |i|
    if i[:clearance] == true
      i[:price] = (i[:price] * 0.8).round(2)
    end
    i
  end
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
