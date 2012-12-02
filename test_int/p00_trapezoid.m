function result = p00_trapezoid ( prob, int_num )

%*****************************************************************************80
%
%% P00_TRAPEZOID applies the composite trapezoid rule to integrate a function.
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
%
%  Code rewritten to vectorize.
%
  x(1:int_num+1) =  ( ( int_num - (0:int_num) ) * a   ...
                    + (           (0:int_num) ) * b ) ...
                    / ( int_num               );

  if ( int_num == 1 )
    result = ...
        0.5 *       p00_fun ( prob, 1, x(1) ) ...
      + 0.5 *       p00_fun ( prob, 1, x(2) );
  else
    result = ...
        0.5 *       p00_fun ( prob, 1,           x(1)         )   ...
      +       sum ( p00_fun ( prob, int_num - 1, x(2:int_num) ) ) ...
      + 0.5 *       p00_fun ( prob, 1,           x(int_num+1) );
  end

  result = result * ( b - a ) / int_num;

  return
end
