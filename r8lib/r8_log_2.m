function value = r8_log_2 ( x )

%*****************************************************************************80
%
%% R8_LOG_2 returns the logarithm base 2 of |X|.
%
%  Discussion:
%
%    R8_LOG_2 ( X ) = Log ( |X| ) / Log ( 2.0 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose base 2 logarithm is desired.
%    X should not be 0.
%
%    Output, real VALUE, the logarithm base 2 of the absolute
%    value of X.  It should be true that |X| = 2**R8_LOG_2.
%
  if ( x == 0.0 )
    value = -inf;
  else
    value = log ( abs ( x ) ) / log ( 2.0 );
  end

  return
end
