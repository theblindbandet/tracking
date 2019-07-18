require 'test_helper'

class TrainingTest < ActiveSupport::TestCase
  def setup
    @training = Training.new(title: "Meme Creation", description: "A course that teaches you how to make the spiciest memes", length: 1)
  end
 
  test "should be valid" do
    assert @training.valid?
  end

  test "title should be present" do
    @training.title = ""
    assert_not @training.valid?
  end

  test "length should be present" do
    @training.length = ""
    assert_not @training.valid?
  end
end
