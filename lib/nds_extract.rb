# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  aoa_i = 0
  while aoa_i < aoa.length do
    inner_i = 0
    while inner_i < aoa[aoa_i].length do
      result << aoa[aoa_i][inner_i]
      inner_i += 1
    end
    aoa_i += 1
  end
  result
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
  newAr=[]
  i=0
  while i<movies_collection.length do
    newAr << movie_with_director_name(name, movies_collection[i])
    i+=1
  end
  newAr
end

def gross_per_studio(collection)
  new_hash = {}
  i=0
  while i<collection.length do
    if !new_hash[collection[i][:studio]] #if not exist
      new_hash[collection[i][:studio]] = collection[i][:worldwide_gross] 
    else
      new_hash[collection[i][:studio]] += collection[i][:worldwide_gross]
    end
    i += 1
  end
  new_hash
end


def movies_with_directors_set(source)
  newAr = []
  i = 0
  while i < source.length do
     name_key = source[i][:name]
     movie_value= source[i][:movies]
     newAr << movies_with_director_key(name_key, movie_value)
     i += 1   #movies_with_director_key(name, movies_collection)
               # * name: A director's name
               # * movies_collection: An Array of Hashes where each Hash represents a movie
  end
  newAr
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
