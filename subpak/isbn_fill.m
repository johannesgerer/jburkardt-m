function isbn = isbn_fill ( isbn )

%*****************************************************************************80
%
%% ISBN_FILL fills in a missing digit in an ISBN code.
%
%  Example:
%
%    Input:
%
%      0-8493-9?40-9
%
%    Output:
%
%      0-8493-9640-9
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
%    Input, string ISBN, a partial ISBN code, with a
%    single digit replaced by the character '?', signifying
%    that that digit is missing.  
%
%    Output, string ISBN, the completed ISBN code.  
%
  lenc = s_len_trim ( isbn );

  i = 0;
  isbn_pos = -1;
  digit_pos = -1;
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

    elseif ( ( num_digit == 9 & isbn(i:i) == 'X' ) | ...
             ( num_digit == 9 & isbn(i:i) == 'x' ) )

      num_digit = num_digit + 1;
      digit(num_digit) = isbn_to_i4 ( c );

    elseif ( c == '?' )

      if ( isbn_pos == -1 )

        num_digit = num_digit + 1;
        digit(num_digit) = 0;
        digit_pos = num_digit;
        isbn_pos = i;

      else
        fprintf ( 1, '\n' );
        fprintf ( 1, 'ISBN_FILL - Fatal error!\n' );
        fprintf ( 1, '  Only one question mark is allowed!\n' );
        error ( 'ISBN_FILL - Fatal error!' );
      end

    end

    if ( 10 <= num_digit )
      break
    end

  end

  if ( num_digit ~= 10 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ISBN_FILL - Fatal error!\n' );
    fprintf ( 1, '  The input ISBN code did not have 10 digits.\n' );
    error ( 'ISBN_FILL - Fatal error!' );
  end

  if ( isbn_pos == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ISBN_FILL - Fatal error!\n' );
    fprintf ( 1, '  A question mark is required!\n' );
    error ( 'ISBN_FILL - Fatal error!' );
  end

  check = 0;
  for i = 1 : 10
    check = check + ( 11 - i ) * digit(i);
  end

  check = mod ( check, 11 );

  if ( check == 0 )

    k = 0;
%
%  Need to solve the modular equation:
%
%    A * X = B mod C
%
%  Below is a stupid way.  One day I will come back and fix this up.
%
  else

    for i = 1 : 10
      j = ( 11 - digit_pos ) * i + check;
      if ( mod ( j, 11 ) == 0 )
        k = i;
      end
    end

  end

  isbn(isbn_pos) = i4_to_isbn ( k );

  return
end
