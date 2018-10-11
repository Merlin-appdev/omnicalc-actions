class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    # Median
    # ======

     def median(array)                          #Define your method accepting an array as an argument. 
     array = array.sort                         #sort the array from least to greatest
     if array.length.odd?                       #is the length of the array odd?
        return array[(array.length - 1) / 2]    #find value at this index
     else array.length.even?                    #is the length of the array even?
        return ( array[array.length/2] + array[array.length/2 - 1] )/2.to_f
                                                #average the values found at these two indexes and convert to float
      end
    end
    
    @median = median(@numbers)

    # Sum
    # ======

   total_sum = 0
   @numbers.each do |num|
   total_sum = total_sum + num
   end

    @sum = total_sum
    
    # Mean
    # ======
    
    mean_total = total_sum/@numbers.length
    @mean = mean_total

    # Variance
    # ========
    
  diff_sqr = 0
  @numbers.each do |num|
    diff_sqr = diff_sqr + (num - mean_total)**2
  end
  
  var_numbers = diff_sqr / @numbers.length
    
    @variance = var_numbers
    
    stdv_numbers = var_numbers**0.5

    @standard_deviation = stdv_numbers

    # Mode
    # ====
    
def mode(array)

    count = []  # Number of times element is repeated in array
    output = []
    array.compact!
    unique = array.uniq
    
    j=0
    unique.each do |i|
        count[j] = array.count(i)
        j+=1
    end
    
    k=0
    count.each do |i|
        output[k] = unique[k] if i == count.max
        k+=1
    end  

    return output.compact.inspect

end
    
    mode_numbers = mode(@numbers)
    
    @mode = mode_numbers

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
