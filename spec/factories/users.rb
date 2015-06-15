FactoryGirl.define do

  factory :null_email, class: User do

    email nil
    password "password"
  end

  factory :valid_user, class: User do

    username "test"
    email "test@test.com"
    password "password"
  end

  factory :username_too_long, class: User do

    username "GCQWXVGSXFRVSYUQAXEIWCFOIXSNMZYBQDPVZJUOMCDGQCOWPYIFG"
    email "test@test.com"
    password "password"
  end

  factory :null_username, class: User do

    username nil
    email "test@test.com"
    password "password"
  end

  factory :invalid_email, class: User do

    username "test"
    email "testtest.com"
    password "password"
  end

  factory :email_too_long, class: User do

    username "text"
    email "GCQWXVGSXFRVSYUQAXEIWCFOIXSNMZYBQDPVZJUOMCDGQCOWPYIFG@gmail.com"
    password "password"
  end

  factory :null_password, class: User do

    username "test"
    email "test@test.com"
    password nil
  end

  factory :password_too_long, class: User do

    username "test"
    email "test@test.com"
    password "GCQWXVGSXFRVSYUQAXEIWCFOIXSNMZYBQDPVZJUOMCDGQCOWPYIFG"
  end

end
