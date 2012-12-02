function result = p00_montecarlo ( prob, int_num )

%*****************************************************************************80
%
%% P00_MONTECARLO applies the Monte Carlo rule to integrate a function.
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
%    Input, integer INT_NUM, the number of sample points.
%
%    Output, real RESULT, the approximate integral.
%
  [ a, b ] = p00_lim ( prob );

  seed = 123456789;

  [ x, seed ] = r8vec_uniform ( int_num, a, b, seed );

  result = sum ( p00_fun ( prob, int_num, x ) );

  result = result * ( b - a ) / int_num;

  return
end
