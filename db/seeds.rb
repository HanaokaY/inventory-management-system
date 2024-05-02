# db/seeds.rb

# Products
10.times do |i|
    Product.create(
        name: "Product #{i + 1}",
        description: "Description for product #{i + 1}",
        price: rand(100.0..1000.0).round(2),
        sku: "SKU#{1000 + i}"
    )
end

# Inventory
Product.all.each do |product|
    Inventory.create(
        product: product,
        quantity: rand(10..100),
        location: "Location #{rand(1..10)}"
    )
end

# Transactions
Product.all.each do |product|
    Transaction.create(
        product: product,
        transaction_type: ['import', 'export'].sample,
        quantity: rand(1..10),
        transaction_date: Time.now,
        operator: "Operator #{rand(1..10)}"
    )
end

# Users
10.times do |i|
    User.create(
        username: "user#{i + 1}",
        password_digest: "password#{i + 1}",
        role: ['admin', 'staff'].sample
    )
end

# Notifications
Product.all.each do |product|
    Notification.create(
        product: product,
        message: "Low stock for #{product.name}",
        status: ['sent', 'pending'].sample,
        notification_date: Time.now - rand(1..100).hours
    )
end
