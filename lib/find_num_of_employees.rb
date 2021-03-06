# Find number of Employees Under every Employee
# Given a dictionary that contains mapping of employee
# and his manager as a number of (employee, manager) pairs like below.

# { "A", "C" },
# { "B", "C" },
# { "C", "F" },
# { "D", "E" },
# { "E", "F" },
# { "F", "F" }

# In this example C is manager of A,
# C is also manager of B, F is manager
# of C and so on.
# Write a function to get no of employees under each manager in the hierarchy
# not just their direct reports. It may be assumed that an employee
# directly reports to only one manager. In the above dictionary the root node/ceo
# is listed as reporting to himself.
# Output should be a Dictionary that contains following.

# A - 0
# B - 0
# C - 2
# D - 0
# E - 1
# F - 5

# Convert to Ruby hash:
# hash = { "A" => "C", "B" => "C", "C" => "F","D" => "E","E" => "F", "F" => "F" }

##TODO
def solve(hash)
  manager_sizing = Hash.new { |h, k| h[k] = [] }
  employees = hash.keys
  managers = hash.values

  ##Find plain old employees & add them to the output with 0 reports.
  employees.each { |e| manager_sizing[e] = 0 unless managers.include?(e) }

  manager_map = Hash.new { |h, k| h[k] = [] }
  hash.each do |employee, manager|
    manager_map[manager] << employee
  end

  ##Place in the regular employees.
  manager_map.each do |man, emp|
    managers.each do |manager|
      if !emp.include?(manager)
        manager_sizing[man] = emp.size
      end
    end
  end

  #Iterate uniq managers
  managers.uniq.each do |manager|
    # Only run below for managers not already included.
    # i.e. not for people who are not managers of managers
    if manager_sizing.key(manager).nil?
      reports = manager_map[manager]

      #Remove the manager himeself for now.
      reports.delete(manager)

      count = 0

      reports.each do |report|
        count += manager_sizing[report]
      end
      manager_sizing[manager] = (count + reports.size)
    end
    # do nothing
  end
  manager_sizing
end

