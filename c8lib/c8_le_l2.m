function value = c8_le_l2 ( x, y )

%*****************************************************************************80
%
%% C8_LE_L2 := X <= Y for complex values, and the L2 norm.
%
%  Discussion:
%
%    The L2 norm can be defined here as:
%
%      C8_NORM_L2(X) = sqrt ( ( real (X) )**2 + ( imag (X) )**2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex X, Y, the values to be compared.
%
%    Output, logical VALUE, is TRUE if X <= Y.
%
  if ( ( real ( x ) )^2 + ( imag ( x ) )^2 ...
    <= ( real ( y ) )^2 + ( imag ( y ) )^2 ) 
    value = 1;
  else
    value = 0;
  end

  return
end
