require 'test_helper'
require 'minitest/rails'

feature 'Visiting the Post Index' do
  scenario 'with existing posts' do
    sign_in(:author)
    visit new_post_path

    fill_in "Name", with: posts(:create_post).name
    fill_in "Title", with: posts(:create_post).title
    fill_in "Content", with: posts(:create_post).content

    click_on "Create Post"
    visit posts_path
    save_and_open_page
    page.text.must_include 'This is how I learned to make web apps.'
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

