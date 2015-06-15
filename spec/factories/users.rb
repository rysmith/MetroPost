FactoryGirl.define do

  #valid users
  factory :valid_user, class: User do

    username 'test'
    email 'test@test.com'
    password 'password1'
  end

  factory :valid_user_upper, class: User do

    username 'TEST'
    email 'TEST@TEST.COM'
    password 'password1'
  end

  #email
  factory :null_email, class: User do

    email nil
    password 'password1'
  end

  factory :invalid_email_no_at, class: User do

    username 'test'
    email 'testtest.com'
    password 'password1'
  end

  factory :invalid_email_no_TLD, class: User do

    username 'test'
    email 'testtest'
    password 'password1'
  end

  factory :email_too_long, class: User do

    username 'text'
    email 'GCQWXVGSXFRVSYUQAXEIWCFOIXSNMZYBQDPVZJUOMCDGQCOWPYIFG@gmail.com'
    password 'password1'
  end

  #username
  factory :username_too_long, class: User do

    username 'GCQWXVGSXFRVSYUQAXEIWCFOIXSNMZYBQDPVZJUOMCDGQCOWPYIFG1'
    email 'test@test.com'
    password 'password1'
  end

  factory :null_username, class: User do

    username nil
    email 'test@test.com'
    password 'password1'
  end

  #password
  factory :null_password, class: User do

    username 'test'
    email 'test@test.com'
    password nil
  end

  factory :password_too_long, class: User do

    username 'test'
    email 'test@test.com'
    password 'GCQWXVGSXFRVSYUQAXEIWCFOIXSNMZYBQDPVZJUOMCDGQCOWPYIFG1'
  end

  factory :password_too_short, class: User do

    username 'test'
    email 'test@test.com'
    password '1234567'

  end

  factory :password_mismatch, class: User do

    username 'test'
    email 'test@test.com'
    password '12345678a'
    password_confirmation '123456789a'
  end

  factory :password_match, class: User do

    username 'test'
    email 'test@test.com'
    password '12345678a'
    password_confirmation '12345678a'
  end

  factory :insecure_password, class: User do

    username 'test'
    email 'test@test.com'
    password '12345678'
    password_confirmation '12345678'
  end
end
