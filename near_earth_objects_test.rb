require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test

  def test_it_exists
    neos = NearEarthObjects.new('2019-03-30')
    assert_instance_of NearEarthObjects, neos
  end

  def test_it_has_attributes
    neos = NearEarthObjects.new('2019-03-30')
    assert_equal "2019-03-30", neos.date 
  end

  def test_parsed_asteroids_data_is_array
    neos = NearEarthObjects.new('2019-03-30')
    assert_equal Array, neos.parsed_asteroids_data.class
  end

  def test_a_date_returns_a_list_of_neos
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    assert_equal '(2019 GD4)', results[:asteroid_list][0][:name]
  end

  def test_neos_hash
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    assert_equal Hash, results.class
    assert_equal 3, results.length
    assert_equal Array, results[:asteroid_list].class
    assert_equal Hash, results[:asteroid_list][0].class
    assert_equal Integer, results[:biggest_asteroid].class
    assert_equal Integer, results[:total_number_of_asteroids].class
  end
end
