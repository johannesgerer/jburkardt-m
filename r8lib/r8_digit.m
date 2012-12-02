function digit = r8_digit ( x, idigit )

%*****************************************************************************80
%
%% R8_DIGIT returns a particular decimal digit of an R8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose NDIG-th decimal digit
%    is desired.  If X is zero, all digits will be returned as 0.
%
%    Input, integer IDIGIT, the position of the desired decimal digit.
%    A value of 1 means the leading digit, a value of 2 the second digit
%    and so on.
%
%    Output, integer DIGIT, the value of the IDIGIT-th decimal digit of X.
%
  if ( x == 0.0 )
    digit = 0;
    return
  end

  if ( idigit <= 0 )
    digit = 0;
    return
  end
%
%  Force X to lie between 1 and 10.
%
  x = abs ( x );

  while ( x < 1.0 )
    x = x * 10.0;
  end

  while ( 10.0 <= x )
    x = x / 10.0;
  end

  for i = 1 : idigit
    ival = floor ( x );
    x = ( x - ival ) * 10.0;
  end

  digit = ival;

  return
end
