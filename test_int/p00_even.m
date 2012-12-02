function result = p00_even ( prob, int_num )

%*****************************************************************************80
%
%% P00_EVEN uses evenly spaced points to integrate a function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2009
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

  if ( int_num == 1 )
    x(1) = ( a + b ) / 2.0;
  else
    x(1:int_num) = ( ( int_num - (1:int_num)     ) * a    ...
                   + (           (1:int_num) - 1 ) * b  ) ...
                   / ( int_num               - 1 );
  end

  result = sum ( p00_fun ( prob, int_num, x(1:int_num) ) );

  result = ( b - a ) * result / int_num;

  return
end
