require 'test_helper'
require 'minitest/rails'

describe PostsController do
  it 'displays a page for posts' do
    get :index
    assert_response :success
  end
end

feature 'Visiting the Post Index' do
  scenario 'with existing posts'
    Post.create(name: 'Code Fellow', title: 'Becoming a Code Fellow', content: 'Means striving for excellence.')
    visit posts_path
    page.text.must_include 'Becoming a Code Fellow'
  end
end

feature 'Testing validation of new post' do
  scenario 'without a name' do
    Post.create(title: 'Becoming a Code Fellow', content: 'Means striving for excellence.')
    visit posts_path
    page.text.wont_include 'Becoming a Code Fellow'
  end
end

