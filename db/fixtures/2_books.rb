@i = 1
title = Faker::Lorem.word
description = Faker::Lorem.paragraph(4)
image = File.new("#{Rails.root}/public/attach/placeholder.png", 'r')
book = File.new("#{Rails.root}/public/attach/book.epub")

# With free access (user 1)
3.times do
  Book.seed(:id, 
    { id: @i, title: title, description: description, free: true, user_id: 1, author: User.find(1).email, image: image, document: book }
  )
  @i += 1
end

# Without free access (user 1)
3.times do
  Book.seed(:id, 
    { id: @i, title: title, description: description, free: false, user_id: 1, author: User.find(1).email, image: image, document: book }
  )
  @i += 1
end

# With free access (user 2)
3.times do
  Book.seed(:id, 
    { id: @i, title: title, description: description, free: true, user_id: 2, author: User.find(2).email, image: image, document: book }
  )
  @i += 1
end

# Without free access (user 2)
3.times do
  Book.seed(:id, 
    { id: @i, title: title, description: description, free: false, user_id: 2, author: User.find(2).email, image: image, document: book }
  )
  @i += 1
end
