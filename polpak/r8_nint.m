function value = r8_nint ( x )

%*****************************************************************************80
%
%% R8_NINT returns the nearest integer to an R8.
%
%  Example:
%
%        X        R8_NINT
%
%      1.3         1
%      1.4         1
%      1.5         1 or 2
%      1.6         2
%      0.0         0
%     -0.7        -1
%     -1.1        -1
%     -1.6        -2
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
%    Input, real X, the value.
%
%    Output, integer VALUE, the nearest integer to X.
%
  if ( x < 0.0 )
    s = -1;
  else
    s = 1;
  end

  value = s * round ( abs ( x ) + 0.5 );

  return
end
