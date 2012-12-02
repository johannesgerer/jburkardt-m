function result = p00_simpson ( prob, int_num )

%*****************************************************************************80
%
%% P00_SIMPSON applies the composite Simpson rule to integrate a function.
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

  h = ( b - a ) / ( int_num );
%
%  This section of the code was rewritten to vectorize.
%
  x(1:2*int_num+1) = ( ( 2*int_num - ( 0 : 2*int_num ) ) * a   ...
                   + (               ( 0 : 2*int_num ) ) * b ) ...
                     / ( 2*int_num                         );
   
  if ( 1 == int_num )
    result = ...
                    p00_fun ( prob, 1,           x(1) ) ...
      + 4.0 *       p00_fun ( prob, int_num,     x(2) ) ...
      +             p00_fun ( prob, 1,           x(3) );
  else
    result = ...
                    p00_fun ( prob, 1,           x(1)               ) ...
      + 2.0 * sum ( p00_fun ( prob, int_num - 1, x(3:2:2*int_num-1) ) ) ...
      + 4.0 * sum ( p00_fun ( prob, int_num,     x(2:2:2*int_num)   ) )...
      +             p00_fun ( prob, 1,           x(2*int_num+1)     );
   end

  result = result * h / 6.0;

  return
end
