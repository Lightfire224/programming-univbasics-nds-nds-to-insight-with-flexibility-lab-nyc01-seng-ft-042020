# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  a = []
  aoa_i = 0
  while aoa_i < aoa.length do
    inner_i = 0
    while inner_i < aoa[aoa_i].length do
      a << aoa[aoa_i][inner_i]
      inner_i += 1
    end
    aoa_i += 1
  end
  a
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

def movies_with_director_key(name, movies_collection)
  new_array= []
  counter = 0
  while counter <movies_collection.length do
    new_array << movie_with_director_name(name, movies_collection[counter])
    counter +=1
  end
  new_array
end

def gross_per_studio(collection)
  new_hash = {}
  counter=0
  while counter<collection.length do
    if !new_hash[collection[counter][:studio]] #if not exist
      new_hash[collection[counter][:studio]] = collection[counter][:worldwide_gross] 
    else
      new_hash[collection[counter][:studio]] += collection[counter][:worldwide_gross]
    end
    counter += 1
  end
  new_hash
end


def movies_with_directors_set(source)
  new_array = []
  counter = 0
  while counter < source.length do
     name_key = source[counter][:name]
     movie_value= source[counter][:movies]
     new_array << movies_with_director_key(name_key, movie_value)
     counter += 1   
  end
  new_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
