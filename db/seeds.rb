require 'bcrypt'
User.destroy_all

User.create!([
                 {
                     name: "Applifter",
                     email: "info@applifting.cz",
                     password_digest: BCrypt::Password.create("SecreatPassword")
                 },
                 {
                     name: "Batman",
                     email: "batman@applifint.cz",
                     password_digest: BCrypt::Password.create("OtherPassword")
                 }
 ])