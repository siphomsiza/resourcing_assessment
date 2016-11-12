class AddDefaultNote < SeedMigration::Migration
  def up
    Note.delete_all
    user = User.last
    10.times do
      object = Note.new({title: Faker::Lorem.sentence,
                         content: Faker::Lorem.paragraph,
                         color: ["yellow","blue","green","pink"].sample,
                         private: Faker::Boolean.boolean ,
                         pos_x: Faker::Number.number(2)+"px",
                         pos_y: Faker::Number.number(2)+"px",
                         z_index: Faker::Number.digit
                         })
      object.user = user
      object.save!
      puts ['id', 'title', 'content', 'color', 'private'].map{|x| {x => object.send(x)}}
    end
  end

  def down
    Note.delete_all
  end
end
