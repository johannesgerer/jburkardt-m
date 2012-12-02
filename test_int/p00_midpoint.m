function result = p00_midpoint ( prob, int_num )

%*****************************************************************************80
%
%% P00_MIDPOINT applies the composite midpoint rule to integrate a function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem index.
%
%    Input, integer INT_NUM, the number of subintervals.
%
%    Output, real RESULT, the approximate integral.
%
  [ a, b ] = p00_lim ( prob );

  x = linspace ( a, b, 2 * int_num + 1 );

  x = x(2:2:2*int_num);

  result = sum ( p00_fun ( prob, int_num, x ) );

  result = result * ( b - a ) / int_num;

  return
end
