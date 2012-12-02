function value = r8_walsh_1d ( x, digit )

%*****************************************************************************80
%
%% R8_WALSH_1D evaluates the Walsh function.
%
%  Discussion:
%
%    Consider the binary representation of X, and number the digits
%    in descending order, from leading to lowest, with the units digit
%    being numbered 0.
%
%    The Walsh function W(J)(X) is equal to the J-th binary digit of X.
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
%    Input, real X, the argument of the Walsh function.
%
%    Input, integer DIGIT, the index of the Walsh function.
%
%    Output, real VALUE, the value of the Walsh function.
%

%
%  Hide the effect of the sign of X.
%
  x = abs ( x );
%
%  If DIGIT is positive, divide by 2 DIGIT times.
%  If DIGIT is negative, multiply by 2 (-DIGIT) times.
%
  x = x / 2.0 ^ digit;
%
%  Make it an integer.
%  Because it's positive, and we're using INT, we don't change the
%  units digit.
%
  n = floor ( x );
%
%  Is the units digit odd or even?
%
  if ( mod ( n, 2 ) == 0 )
    value = 0.0;
  else
    value = 1.0;
  end

  return
end
