function check = isbn_check ( isbn )

%*****************************************************************************80
%
%% ISBN_CHECK checks an ISBN code.
%
%  Discussion:
%
%    ISBN stands for International Standard Book Number.  A unique ISBN
%    is assigned to each new book.  The ISBN includes 10 digits.  There is
%    an initial digit, then a dash, then a set of digits which are a
%    code for the publisher, another digit, and then the check digit:
%
%      initial-publisher-book-check
%
%    The number of digits used for the publisher and book codes can vary,
%    but the check digit is always one digit, and the total number of
%    digits is always 10.
%
%    The check digit is interesting, because it is a way of trying to
%    make sure that an ISBN has not been incorrectly copied.  Specifically,
%    if the ISBN is correct, then its ten digits will satisfy
%
%       10 * A + 9 * B + 8 * C + 7 * D + 6 * E
%      + 5 * F * 4 * G * 3 * H + 2 * I +     J  = 0 mod 11.
%
%    Here, we've taken 'A' to represent the first digit and 'J' the
%    last (which is the check digit).  In order for the code to work,
%    the value of J must be allowed to be anything from 0 to 10.  In
%    cases where J works out to be 10, the special digit 'X' is used.
%    An 'X' digit can only occur in this last check-digit position
%    on an ISBN.
%
%  Example:
%
%    0-8493-9640-9
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Book Industry Study Group,
%    The Evolution in Product Identification:
%    Sunrise 2005 and the ISBN-13,
%    http://www.bisg.org/docs/The_Evolution_in_Product_ID.pdf
%
%  Parameters:
%
%    Input, string ISBN, an ISBN code.
%
%    Output, integer CHECK, the value of the ISBN check sum.
%    If CHECK is zero, the ISBN code is legitimate.
%    If CHECK is -1, then the ISBN code is not legitimate because it does
%    not contain exactly 10 digits.  If CHECK is between 1 and 10, then
%    the ISBN code has the right number of digits, but at least one of
%    the digits is incorrect.
%

%
%  Determine how many digits have been supplied.
%
  lenc = s_len_trim ( isbn );

  i = 0;
  num_digit = 0;

  while ( 1 )

    i = i + 1;

    if ( lenc < i )
      break
    end

    c = isbn(i);

    if ( ch_is_digit ( c ) )

      num_digit = num_digit + 1;
      digit(num_digit) = isbn_to_i4 ( c );

    elseif ( ( num_digit == 9 & isbn(i) == 'X' ) || ...
             ( num_digit == 9 & isbn(i) == 'x' ) )

      num_digit = num_digit + 1;
      digit(num_digit) = isbn_to_i4 ( c );

    end

    if ( 10 <= num_digit )
      break
    end

  end
%
%  If we didn't get exactly 10 digits, return with an error.
%
  if ( num_digit ~= 10 )
    check = -1;
    return
  end
%
%  Compute the checksum.
%
  check = 0;
  for i = 1 : 10
    check = check + ( 11 - i ) * digit(i);
  end

  check = mod ( check, 11 );

  return
end
