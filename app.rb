require 'bundler'
require 'smarter_csv'
Bundler.require()

# Your program should calculate the population and housing densities for each place (https://www.census.gov/geo/reference/gtc/gtc_place.html), and the densest and sparsest places. You can use your preferred programming language, and decide on the presentation format of the resulting data.


##Enter the following into Command Line using pry or irb, then enter: require 'smarter_csv'
##It will print out the population density and housing density per square mile
parsed_data = SmarterCSV.process('http://forever.codeforamerica.org/fellowship-2016-tech-interview/tracts.txt', {:col_sep => "\t"})

for x in parsed_data
puts "Census Tract #" << " " << x[:tract].to_s << " = " << "Population Density:" << " " << (x[:population].to_f/(x[:land_area]/1609.344)).to_s << " per square mile," << " Housing Density: " << " " << (x[:housing_units].to_f/(x[:land_area]/1609.344)).to_s << " per square mile"
end
