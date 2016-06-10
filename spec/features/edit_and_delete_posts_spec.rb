require 'rails_helper'

require_relative '../support/new_posts_form.rb'

feature 'Create and edit posts' do
  let(:new_posts_form) {NewPostsForm.new}

  scenario 'Create and Edit a post' do
    new_posts_form.visit_new_post.fill_in_with(
    title: 'foobaz'
    ).submit

    new_posts_form.edit_post
  end

  scenario 'Create and Delete a post' do
    new_posts_form.visit_new_post.fill_in_with(
    title: 'foobaz'
    ).submit
  end
end
