function [ f, i ] = fibonacci_floor ( n )

%*****************************************************************************80
%
%% FIBONACCI_FLOOR returns the largest Fibonacci number less than or equal to N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the positive integer whose Fibonacci "floor" is desired.
%
%    Output, integer F, the largest Fibonacci number less than or equal to N.
%
%    Output, integer I, the index of the F.
%
  if ( n <= 0 )

    i = 0;
    f = 0;

  else

    i = floor ( log ( 0.5 * ( 2 * n + 1 ) * sqrt ( 5.0 ) ) ...
      / log ( 0.5 * ( 1.0 + sqrt ( 5.0 ) ) ) );

    f = fibonacci_direct ( i );

    if ( n < f )
      i = i - 1;
      f = fibonacci_direct ( i );
    end

  end

  return
end
