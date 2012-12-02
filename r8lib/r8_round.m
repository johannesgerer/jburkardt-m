function value = r8_round ( x )

%*****************************************************************************80
%
%% R8_ROUND sets an R8 to the nearest integral value.
%
%  Example:
%
%        X        R8_ROUND
%
%      1.3         1.0
%      1.4         1.0
%      1.5         1.0 or 2.0
%      1.6         2.0
%      0.0         0.0
%     -0.7        -1.0
%     -1.1        -1.0
%     -1.6        -2.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the value.
%
%    Output, real R8_ROUND, the rounded value.
%
  if ( x < 0.0 )
    value = - floor ( - x + 0.5 );
  else
    value =   floor ( + x + 0.5 );
  end

  return
end
