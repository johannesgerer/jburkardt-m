function value = r8_log_b ( x, b )

%*****************************************************************************80
%
%% R8_LOG_B returns the logarithm base B of |X|.
%
%  Discussion:
%
%    value = log ( |X| ) / log ( |B| )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose base B logarithm is desired.
%    X should not be 0.
%
%    Input, real B, the base, which should not be 0, 1 or -1.
%
%    Output, real VALUE, the logarithm base B of the absolute
%    value of X.  It should be true that |X| = |B|**D_LOG_B.
%
  if ( b == 0.0 || b == 1.0 || b == -1.0 )
    value = -inf;
  elseif ( abs ( x ) == 0.0 )
    value = -inf;
  else
    value = log ( abs ( x ) ) / log ( abs ( b ) );
  end

  return
end
