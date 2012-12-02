function value = c8_le_l1 ( x, y )

%*****************************************************************************80
%
%% C8_LE_L1 := X <= Y for C8's, and the L1 norm.
%
%  Discussion:
%
%    The L1 norm can be defined here as:
%
%      C8_NORM_L1(X) = abs ( real (X) ) + abs ( imag (X) )
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
  if ( abs ( real ( x ) ) + abs ( imag ( x ) ) ...
    <= abs ( real ( y ) ) + abs ( imag ( y ) ) ) 
    value = 1;
  else
    value = 0;
  end

  return
end
