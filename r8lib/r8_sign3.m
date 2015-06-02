function value = r8_sign3 ( x )

%*****************************************************************************80
%
%% R8_SIGN3 returns the three-way sign of an R8.
%
%  Discussion:
%
%    The value is +1 if the number is positive, 0 if 0, and -1 otherwise.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose sign is desired.
%
%    Output, real VALUE, the sign of X.
%
  if ( x < 0.0 )
    value = -1.0;
  elseif ( x == 0.0 )
    value = 0.0;
  else
    value = 1.0;
  end

  return
end
