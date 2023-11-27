let rec sum_of_series n =
  if n <= 0 then
    0
  else
    n + sum_of_series (n - 1)  

let square_of_sum n = 
  let sum = sum_of_series n in
  sum * sum

let rec sum_of_squares n =
  if n <= 0 then
    0
  else
    (n * n) + sum_of_squares (n - 1)  

let difference_of_squares n =
  square_of_sum n - sum_of_squares n
