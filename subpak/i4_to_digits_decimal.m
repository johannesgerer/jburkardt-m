function digit = i4_to_digits_decimal ( i, n )

%*****************************************************************************80
%
%% I4_TO_DIGITS_DECIMAL determines the last N decimal digits of an integer.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the integer to be analyzed.
%
%    Input, integer N, the number of digits to determine.
%
%    Output, integer DIGIT(N), the last N decimal digits of I.
%    DIGIT(I) is the "coefficient" of 10**(I-1).
%
  i_copy = floor ( i );

  for j = 1 : n
    digit(j) = mod ( i_copy, 10 );
    i_copy = floor ( ( i_copy - digit(j) ) / 10 );
  end

  return
end
