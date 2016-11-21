description = Faker::Lorem.paragraph(4)
book = File.new("#{Rails.root}/public/attach/book.epub")

# With free access (user 1)
Book.seed(:id, 
  { id: 1, title: 'Мрачный Жнец', description: description, free: true, user_id: 1, author: User.find(1).email, image: File.new("#{Rails.root}/public/attach/znets.png", 'r'), document: book },
  { id: 2, title: '451 градус по Фаренгейту', description: description, free: true, user_id: 1, author: User.find(1).email, image: File.new("#{Rails.root}/public/attach/451.jpg", 'r'), document: book },
  { id: 3, title: '1984', description: description, free: true, user_id: 1, author: User.find(1).email, image: File.new("#{Rails.root}/public/attach/1984.png", 'r'), document: book }
)

# Without free access (user 1)
Book.seed(:id, 
   { id: 4, title: 'О дивный новый мир', description: description, user_id: 1, author: User.find(1).email, image: File.new("#{Rails.root}/public/attach/mir.jpg", 'r'), document: book },
   { id: 5, title: 'Мор, ученик смерти', description: description, user_id: 1, author: User.find(1).email, image: File.new("#{Rails.root}/public/attach/mor.jpg", 'r'), document: book },
   { id: 6, title: 'Крестный отец', description: description, user_id: 1, author: User.find(1).email, image: File.new("#{Rails.root}/public/attach/otec.png", 'r'), document: book }
)

# With free access (user 2)
Book.seed(:id, 
   { id: 7, title: 'Мастер и Маргарита', description: description, free: true, user_id: 2, author: User.find(2).email, image: File.new("#{Rails.root}/public/attach/mim.png", 'r'), document: book },
   { id: 8, title: 'Судьба человека', description: description, free: true, user_id: 2, author: User.find(2).email, image: File.new("#{Rails.root}/public/attach/sudba.png", 'r'), document: book },
   { id: 9, title: 'Война и мир', description: description, free: true, user_id: 2, author: User.find(2).email, image: File.new("#{Rails.root}/public/attach/voyna.jpg", 'r'), document: book }
)

# Without free access (user 2)
Book.seed(:id, 
  { id: 10, title: 'Марсианские хроники', description: description, user_id: 2, author: User.find(2).email, image: File.new("#{Rails.root}/public/attach/mars.jpeg", 'r'), document: book },
  { id: 10, title: 'Автостопом по галактике', description: description, user_id: 2, author: User.find(2).email, image: File.new("#{Rails.root}/public/attach/avto.png", 'r'), document: book },
  { id: 10, title: 'Белая гвардия', description: description, user_id: 2, author: User.find(2).email, image: File.new("#{Rails.root}/public/attach/belaya.png", 'r'), document: book }
)
