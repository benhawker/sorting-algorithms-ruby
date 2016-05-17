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
  output = {}
  manager_sizing = Hash.new { |h, k| h[k] = [] }
  employees = hash.keys
  managers = hash.values

  ##Find plain old employees & add them to the output with 0 reports.
  employees.each { |e| manager_sizing[e] = 0 unless managers.include?(e) }

  manager_map = Hash.new { |h, k| h[k] = [] }
  hash.each do |employee, manager|
    manager_map[manager] << employee
  end

  ##Place in the regular emplyees.
  manager_map.each do |man, emp|
    managers.each do |manager|
      if !emp.include?(manager)
        manager_sizing[man] = emp.size
      end
    end
  end

  ##Then deal with the Managers of Managers
  # manager_map.each do |man, emp|
  #   managers.each do |manager|
  #     if emp.include?(manager)
  #       emp.each do |report|
  #         # count = 0
  #         if manager_sizing[report]
  #           manager_sizing[man] << manager_map[report].size
  #         else
  #           manager_sizing[man] << 1
  #         end
  #       end
  #     end
  #   end
  # end
end
