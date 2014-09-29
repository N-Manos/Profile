require 'test_helper'
require 'minitest/rails'

feature 'Visiting the Post Index' do
  scenario 'with existing posts' do
    sign_up_a_new_user
    Post.create(name: 'Code Fellow', title: 'Becoming a Code Fellow', content: 'Means striving for excellence.')
    visit posts_path
    page.text.must_include 'Becoming a Code Fellow'
  end
end

feature 'Testing validation of new post' do
  scenario 'without a name' do
    sign_up_a_new_user
    Post.create(title: 'Becoming a Code Fellow', content: 'Means striving for excellence.')
    visit posts_path
    page.text.wont_include 'Becoming a Code Fellow'
  end
end

