require 'pry'
pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}
def get_attr_values(data,attr,name = "")
  if attr == "name"
    names = data.values.map do |keys|
      keys.values.flatten.uniq
    end.flatten.uniq
    return names
  else
    attr_values = data[attr].map do |keys,values|
      values.include?(name)? keys.to_s: nil
    end
    return attr_values.compact
  end
end


def nyc_pigeon_organizer(data)
  # write your code here!
  new_hash={}
  names = get_attr_values(data,"name")
  names.each do |pigeon_name|
    colors = get_attr_values(data,:color,pigeon_name)
    gender = get_attr_values(data,:gender,pigeon_name)
    lives = get_attr_values(data,:lives,pigeon_name)
    new_hash[pigeon_name]= {color: colors,gender: gender,lives: lives}
  end
  new_hash
end


def nyc_pigeon_organizer2(data)
  binding.pry
end

nyc_pigeon_organizer2(pigeon_data)
