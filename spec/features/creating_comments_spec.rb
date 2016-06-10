require 'rails_helper'

require_relative '../support/new_comments_form.rb'
require_relative '../support/new_posts_form.rb'

RSpec.feature  "creating comments", :type => :feature do
  let(:new_posts_form) {NewPostsForm.new}
  let(:new_comments_form) {NewCommentsForm.new}
  scenario 'Create a post and comment on it' do
    #create a post
    new_posts_form.visit_new_post.fill_in_with(
    title: 'fOobaz'
    ).submit
    # opens the post
    new_comments_form.open_a_post
    # the content title was spesifed as $post_content_params in NewPostsForm.fill_in_with
    expect(page).to have_text $post_content_params
  end
end
