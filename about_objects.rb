require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    assert_equal true, 1.is_a?(Object)
    assert_equal true, 1.5.is_a?(Object)
    assert_equal true, "string".is_a?(Object)
    assert_equal true, nil.is_a?(Object)
    assert_equal true, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal "123", 123.to_s
    assert_equal "", nil.to_s
  end

  def test_objects_can_be_inspected
    assert_equal "123", 123.inspect
    assert_equal "nil", nil.inspect
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal Integer, obj.object_id.class
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert_equal true, obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal 1, 0.object_id
    assert_equal 3, 1.object_id
    assert_equal 5, 2.object_id
    assert_equal 155, 77.object_id
    assert_equal 201, 100.object_id
    assert_equal 101 * 2 + 1, 101.object_id

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
    #
    # ID = X * 2 + 1
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    another_obj = obj
    copy = obj.clone

    assert_equal another_obj, obj
    assert_equal another_obj.object_id, obj.object_id
    assert_equal true, obj           != copy
    assert_equal true, obj.object_id != copy.object_id
  end
end
