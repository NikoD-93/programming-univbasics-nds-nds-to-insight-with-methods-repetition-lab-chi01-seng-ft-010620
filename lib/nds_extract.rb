$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  # Write this implementation
array_index = 0 
list = []
while array_index < source.length do
list << source[array_index][:name] 
array_index += 1 
end
list 
end

# expected: ["Larry", "Curly", "Moe", "Iggy"]
            # got: [{:name=>"Larry"}, {:name=>"Curly"}, {:name=>"Moe"}, {:name=>"Iggy"}]

def total_gross(source)
hash = directors_totals(source)
d_names = list_of_directors(source)
total = 0 
i = 0 
while i < d_names.length do
  names_d = d_names[i]
  total += hash[names_d]
  i += 1
end
total
end

# got: [{:movies=>[{:release_year=>1975, :studio=>"Universal", :title=>"Jaws", :worldwide_gross=>260000000},...studio=>"Buena Vista", :title=>"Jack",:worldwide_gross=>58620973}], :name=>"Francis Ford Coppola"}]
 
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
