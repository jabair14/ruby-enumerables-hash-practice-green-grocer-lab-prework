def consolidate_cart(cart)
    new_cart_hash = {} 
  cart.each do |groceries_array| 
    groceries_array.each do |item, attribute_hash| 
      new_cart_hash[item] ||= attribute_hash 
      new_cart_hash[item][:count] ? new_cart_hash[item][:count] += 1 :   
      new_cart_hash[item][:count] = 1 
  end 
end 
new_cart_hash
end

def apply_coupons(cart, coupons)
    coupons.each do |coupon|
    if cart.keys.include? coupon[:item]
      if cart[coupon[:item]][:count] >= coupon[:num]
        new_name = "#{coupon[:item]} W/COUPON"
        if cart[new_name]
          cart[new_name][:count] += coupon[:num]
        else
          cart[new_name] = {
            count: coupon[:num],
            price: coupon[:cost]/coupon[:num],
            clearance: cart[coupon[:item]][:clearance]
          }
        end
        cart[coupon[:item]][:count] -= coupon[:num]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.keys.each do |item|
    if cart[item][:clearance]
      cart[item][:price] = (cart[item][:price]* 0.8).round(2)
    end
  end
  cart
end	


def checkout(cart, coupons)

end
