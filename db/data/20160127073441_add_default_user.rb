class AddDefaultUser < SeedMigration::Migration
  def up
    User.delete_all
    object = User.new(Settings.SYSTEM_USER_DATA.to_hash)
    object.password_confirmation = Settings.SYSTEM_USER_DATA.password
    object.try(:skip_confirmation!)
    object.save!
    puts ['id', 'firstname', 'lastname', 'email', 'password'].map{|x| {x => object.send(x)}}
  end

  def down
    User.delete_all
  end
end
