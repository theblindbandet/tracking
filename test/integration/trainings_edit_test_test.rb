require 'test_helper'

class TrainingsEditTestTest < ActionDispatch::IntegrationTest

  def setup
    @training = trainings(:meme_creation)
  end

  test "successful edit" do
    get edit_training_path(@training)
    assert_select 'h1', 'Edit Training'
    patch training_path(@training), params: {training: {title: "Meme Destruction",
                                                    description: "A course that tells you how to destroy good memes and replace them
                                                                  with stale ones",
                                                    length: 2.5}}
    assert_redirected_to @training
  end

  test "unsuccessful edit" do
    get edit_training_path(@training)
    assert_select 'h1', 'Edit Training'
    patch training_path(@training), params: {training: {title: "",
                                                    description: 123,
                                                    length: "akjldfka"}}
    assert_select 'h1', 'Edit Training'
  end
end
