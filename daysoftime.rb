#!/usr/bin/env ruby

  leapz = ["1600", "1604", "1608", "1612", "1616", "1620", "1624",
 "1628", "1632", "1636", "1640", "1644", "1648", "1652", "1656", "1660",
 "1664", "1668", "1672", "1676", "1680", "1684", "1688", "1692", "1696",
 "1704", "1708", "1712", "1716", "1720", "1724", "1728", "1732", "1736",
 "1740", "1744", "1748", "1752", "1756", "1760", "1764", "1768", "1772",
 "1776", "1780", "1784", "1788", "1792", "1796", "1804", "1808", "1812",
 "1816", "1820", "1824", "1828", "1832", "1836", "1840", "1844", "1848",
 "1852", "1856", "1860", "1864", "1868", "1872", "1876", "1880", "1884",
 "1888", "1892", "1896", "1904", "1908", "1912", "1916", "1920", "1924",
 "1928", "1932", "1936", "1940", "1944", "1948", "1952", "1956", "1960",
 "1964", "1968", "1972", "1976", "1980", "1984", "1988", "1992", "1996",
 "2000", "2004", "2008", "2012", "2016", "2020", "2024", "2028", "2032",
 "2036", "2040", "2044", "2048", "2052", "2056", "2060", "2064", "2068",
 "2072", "2076", "2080", "2084", "2088", "2092", "2096", "2104", "2108",
 "2112", "2116", "2120", "2124", "2128", "2132", "2136", "2140", "2144",
 "2148", "2152", "2156", "2160", "2164", "2168", "2172", "2176", "2180",
 "2184", "2188", "2192", "2196", "2204", "2208", "2212", "2216", "2220",
 "2224", "2228", "2232", "2236", "2240", "2244", "2248", "2252", "2256",
 "2260", "2264", "2268", "2272", "2276", "2280", "2284", "2288", "2292",
 "2296", "2304", "2308", "2312", "2316", "2320", "2324", "2328", "2332",
 "2336", "2340", "2344", "2348", "2352", "2356", "2360", "2364", "2368",
 "2372", "2376", "2380", "2384", "2388", "2392", "2396", "2400"]
 
 dayofchoice = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
"Friday", "Saturday"]
 
 monthname = [nil, "Janurary", "Feburary", "March", "April", "May", 
 "June", "July", "August", "September", "October", "November", "December"]
 
monthdayz = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

monthdayzleapyear = [nil, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

begin # Getting the year
	print "Enter a year (Must be 4 digits): "
	yearz = gets.chomp
	if (yearz.to_i == 0) # Must be a number
		puts "Please use numbers only."
	end
	if (yearz.length != 4) #Making sure the answer is 4 characters
		puts "Please use 4 digits for the year."
	end
	if (yearz.to_i == Time.now.year - 1) # Does not allow a year that has not finished yet
			puts "Please use a year that is before #{Time.now.year - 1}."
	end
	if (yearz.to_i > (Time.now.year - 1))
		puts "Year must be before #{Time.now.year - 1}." 
	end
end until (yearz.to_i < (Time.now.year - 1) and yearz.length == 4 and yearz.to_i != 0)
begin #Gettng the month
	if (yearz.to_i < Time.now.year)
		print "Enter a month (2 digits): "
		monthz = gets.chomp
		if (monthz.to_i == 0)
		puts "Please use numbers only."
		end
		if (monthz.length != 2) #Making sure the answer is 2 characters
			puts "Please use 2 digits for the month."
		end
		if (monthz.to_i > 12) #Making sure the answer is 2 characters
			puts "Please use a number less then or equal to 12."
		end
	end	

end until (monthz.length == 2 and monthz.to_i != 0 and monthz.to_i <= 12)
if (leapz.include?(yearz))
begin #Getting the day
	print "Enter a day (2 digits): "
	dayz = gets.chomp
	if (dayz.to_i == 0)
		puts "Please use numbers only."
	end
	if (dayz.length != 2) #Making sure the answer is 2 characters
		puts "Please use 2 digits for the day."
	end
	if(dayz.to_i > monthdayzleapyear[monthz.to_i])
		puts "There are only #{monthdayzleapyear[monthz.to_i]} in #{monthname[monthz.to_i]}."
	end
end until (dayz.length == 2 and dayz.to_i != 0 and dayz.to_i <= monthdayz[monthz.to_i])
else
begin #Getting the day
	print "Enter a day (2 digits): "
	dayz = gets.chomp
	if (dayz.to_i == 0)
		puts "Please use numbers only."
	end
	if (dayz.length != 2) #Making sure the answer is 2 characters
		puts "Please use 2 digits for the day."
	end
	if(dayz.to_i > monthdayz[monthz.to_i])
		puts "There are only #{monthdayz[monthz.to_i]} in #{monthname[monthz.to_i]}."
	end
end until (dayz.length == 2 and dayz.to_i != 0 and dayz.to_i <= monthdayz[monthz.to_i])
end
	if leapz.include?(yearz)
		yday = Time.new(yearz, monthz, dayz).yday
		
		daycount = 366 - yday
		yearz = yearz.to_i + 1
	else
		ydaypast = Time.new(yearz, monthz, dayz).yday
		daycount = 365 - ydaypast
		yearz = yearz.to_i + 1
	end
yearz2 = yearz.to_i
daycount2 = daycount.to_i
		
begin
	if leapz.include?(yearz2.to_s)
		yearz2 = 1 + yearz2
		daycount2 += 366
	else
		yearz2 = 1 + yearz2
		daycount2 += 365
	end
end until (yearz2.to_i == Time.now.year)
yearz = yearz.to_i - 1
ydaynow = Time.now.yday
daycount3 = ydaynow + daycount2
cday = Time.new(yearz.to_i, monthz.to_i, dayz.to_i).wday
puts "#{monthz}/#{dayz}/#{yearz} was a #{dayofchoice[cday]} and was #{daycount3} days ago."