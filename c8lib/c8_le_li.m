function value = c8_le_li ( x, y )

%*****************************************************************************80
%
%% C8_LE_LI := X <= Y for C*'s, and the L-Infinity norm.
%
%  Discussion:
%
%    The L-Infinity norm can be defined here as:
%
%      C8_NORM_LI(X) = max ( abs ( real (X) ), abs ( imag (X) ) )
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
  if ( max ( abs ( real ( x ) ), abs ( imag ( x ) ) ) ...
    <= max ( abs ( real ( y ) ), abs ( imag ( y ) ) ) ) 
    value = 1;
  else
    value = 0;
  end

  return
end
