fun test(result, correct) =
  if result = correct
  then "Passed"
  else "Failed";

(*** Task 1 ***)
fun is_older (date1 : int*int*int, date2 : int*int*int) = 
  (#1 date1 < #1 date2) orelse
  ((#1 date1 = #1 date2) andalso (#2 date1 < #2 date2)) orelse
  ((#1 date1 = #1 date2) andalso (#2 date1 = #2 date2) andalso (#3 date1 < #3 date2));


print("Task 1 tests:\n");
print("1: " ^ test(is_older((2022, 3, 12), (2021, 4, 15)),   false) ^ "\n");
print("2: " ^ test(is_older((2021, 3, 12), (2021, 4, 15)),   true) ^ "\n");
print("3: " ^ test(is_older((2021, 3, 12), (2021, 3, 12)),   false) ^ "\n");
print("4: " ^ test(is_older((2021, 5, 12), (2021, 5, 1)),   false) ^ "\n");


(*** Task 2 ***)

fun number_in_month (dates : (int*int*int) list, month: int) =
  if null dates
  then 0
  else (if (#2 (hd dates)) = month then 1 else 0) + number_in_month(tl dates, month);


print("Task 2 tests:\n");
print("1: " ^ test(number_in_month([(2022, 3, 12), (2021, 4, 15), (2023, 3, 12), (2023, 4, 15)], 4),   2) ^ "\n");
print("2: " ^ test(number_in_month([(2022, 2, 2), (2021, 2, 10), (2023, 2, 1)], 5),   0) ^ "\n");
print("3: " ^ test(number_in_month([(2022, 9, 12)], 6),   0) ^ "\n");
print("4: " ^ test(number_in_month([], 6),   0) ^ "\n");
print("5: " ^ test(number_in_month([(2022, 7, 12), (2021, 7, 15), (2023, 7, 12), (2023, 7, 15)], 7),   4) ^ "\n");
print("6: " ^ test(number_in_month([(2022, 3, 12), (2021, 8, 15), (2023, 3, 12), (2023, 4, 15)], 8),   1) ^ "\n");


(*** Task 3 ***)

fun number_in_months (dates : (int*int*int) list, months : int list) = 
  if null months
  then 0
  else number_in_month(dates, hd months) + number_in_months(dates, tl months);


print("Task 3 tests:\n");
print("1: " ^ test(number_in_months([(2022, 3, 12), (2021, 4, 15), (2023, 3, 12), (2023, 4, 15)], [4, 3]),   4) ^ "\n");
print("2: " ^ test(number_in_months([(2022, 3, 12), (2020, 2, 11), (2023, 3, 12), (2023, 4, 15)], [4, 3]),   3) ^ "\n");
print("3: " ^ test(number_in_months([(2022, 3, 12), (2020, 3, 11), (2023, 3, 12), (2023, 3, 15)], [4]),   0) ^ "\n");
print("4: " ^ test(number_in_months([], [6]),   0) ^ "\n");
print("5: " ^ test(number_in_months([(2222, 11, 5)], []),   0) ^ "\n");
print("6: " ^ test(number_in_months([], []),   0) ^ "\n");


(*** Task 4 ***)

fun dates_in_month(dates : (int*int*int) list, month: int) =
  if null dates
  then []
  else (if (#2 (hd dates) = month) then [hd dates] else []) @ dates_in_month(tl dates, month);


print("Task 4 tests:\n");
print("1: " ^ test(dates_in_month([(2022, 3, 12), (2021, 4, 15), (2023, 3, 17)], 3),   [(2022, 3, 12), (2023, 3, 17)]) ^ "\n");
print("2: " ^ test(dates_in_month([(2022, 3, 12), (2020, 2, 11), (2023, 3, 12), (2023, 5, 15)], 4),   []) ^ "\n");
print("3: " ^ test(dates_in_month([(2022, 5, 12), (2020, 5, 11), (2023, 5, 12), (2023, 5, 15)], 5),   [(2022, 5, 12), (2020, 5, 11), (2023, 5, 12), (2023, 5, 15)]) ^ "\n");
print("4: " ^ test(dates_in_month([], 6),   []) ^ "\n");


(*** Task 5 ***)

fun dates_in_months(dates : (int*int*int) list, months : int list) =
  if null months
  then []
  else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);



print("Task 5 tests:\n");
print("1: " ^ test(dates_in_months([(2010, 3, 25), (2010, 4, 30), (2002, 3, 1), (2023, 4, 15)], [3, 4]),   [(2010, 3, 25), (2002, 3, 1), (2010, 4, 30), (2023, 4, 15)]) ^ "\n");
print("2: " ^ test(dates_in_months([(2022, 3, 12), (2020, 2, 11), (2023, 2, 12), (2023, 4, 15)], [3, 4]),   [(2022, 3, 12), (2023, 4, 15)]) ^ "\n");
print("3: " ^ test(dates_in_months([(2022, 2, 1), (2020, 1, 11), (2023, 1, 20), (2023, 3, 15)], [4]),   []) ^ "\n");
print("4: " ^ test(dates_in_months([], [6]),   []) ^ "\n");
print("5: " ^ test(dates_in_months([(2222, 11, 5)], []),   []) ^ "\n");
print("6: " ^ test(dates_in_months([], []),   []) ^ "\n");


(*** Task 6 ***)

fun get_nth (strings : string list, n : int) =
  if n = 1
  then hd strings
  else get_nth(tl strings, n - 1);


print("Task 6 tests:\n");
print("1: " ^ test(get_nth(["foo", "bar", "baz", "apchu"], 4), "apchu") ^ "\n");
print("2: " ^ test(get_nth(["I", "am", "a", "list", "of", "strings"], 5), "of") ^ "\n");
print("3: " ^ test(get_nth(["Just", "the", "first"], 1), "Just") ^ "\n");


(*** Task 7 ***)


fun date_to_string (date : int*int*int) =
  let val months = ["January", "February", "March", "April",
   "May", "June", "July", "August", "September",
   "October", "November", "December"]
  in
    get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
  end;


print("Task 7 tests:\n");
print("1: " ^ test(date_to_string((2010, 12, 25)), "December 25, 2010") ^ "\n");
print("2: " ^ test(date_to_string((2023, 4, 15)), "April 15, 2023") ^ "\n");
print("3: " ^ test(date_to_string((2222, 1, 1)), "January 1, 2222") ^ "\n");


(*** Task 8 ***)


fun number_before_reaching_sum (sum : int, nums : int list) =
  if sum <= hd nums
  then 0
  else 1 + number_before_reaching_sum(sum - hd nums, tl nums);


print("Task 8 tests:\n");
print("1: " ^ test(number_before_reaching_sum(5, [1, 2, 3, 4, 5]), 2) ^ "\n");
print("2: " ^ test(number_before_reaching_sum(12, [13, 2, 4, 4, 23]), 0) ^ "\n");
print("3: " ^ test(number_before_reaching_sum(3, [1, 2, 3, 4, 5]), 1) ^ "\n");
print("4: " ^ test(number_before_reaching_sum(15, [2, 2, 5, 5, 5]), 4) ^ "\n");


(*** Task 9 ***)


fun what_month (day : int) =
  let val months_counts = [31, 28, 31, 30, 31, 30, 31, 
				     31, 30, 31, 30, 31]
  in
    number_before_reaching_sum(day, months_counts) + 1
  end;


print("Task 9 tests:\n");
print("1: " ^ test(what_month(12), 1) ^ "\n");
print("2: " ^ test(what_month(59), 2) ^ "\n");
print("3: " ^ test(what_month(60), 3) ^ "\n");
print("4: " ^ test(what_month(135), 5) ^ "\n");


(*** Task 10 ***)


fun month_range (day1 : int, day2 : int) =
  if day1 > day2
  then []
  else [what_month(day1)] @ month_range(day1 + 1, day2);


print("Task 10 tests:\n");
print("1: " ^ test(month_range(12, 20), [1, 1, 1, 1, 1, 1, 1, 1, 1]) ^ "\n");
print("2: " ^ test(month_range(322, 245), []) ^ "\n");
print("3: " ^ test(month_range(59, 64), [2, 3, 3, 3, 3, 3]) ^ "\n");
print("4: " ^ test(month_range(31, 34), [1,2,2,2]) ^ "\n");


(*** Task 11 ***)


fun oldest (dates : (int*int*int) list) =
  if null dates
  then NONE
  else let
    fun oldest_nonempty (dates : (int*int*int) list) =
    if null (tl dates)
    then hd dates
    else let 
      val tail_oldest = oldest_nonempty(tl dates)
      in
        if is_older(hd dates, tail_oldest)
        then hd dates
        else tail_oldest
      end
  in
    SOME (oldest_nonempty(dates))
  end;


print("Task 2 tests:\n");
print("1: " ^ test(oldest([(2022, 2, 10), (2022, 2, 11), (2023, 2, 12), (2023, 4, 15)]),  SOME((2022, 2, 10))) ^ "\n");
print("2: " ^ test(oldest([(2010, 3, 25), (2010, 4, 30), (2002, 3, 1)]),  SOME((2002, 3, 1))) ^ "\n");
print("3: " ^ test(oldest([(2022, 3, 12), (2020, 2, 11), (2023, 3, 12), (2023, 5, 15)]),  SOME((2020, 2, 11))) ^ "\n");
print("4: " ^ test(oldest([]), NONE) ^ "\n");
