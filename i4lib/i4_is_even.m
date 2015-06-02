function value = i4_is_even ( i )

%*****************************************************************************80
%
%% I4_IS_EVEN returns TRUE if I is even.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the integer to be tested.
%
%    Output, logical VALUE, is TRUE if I is even.
%
  value = ( mod ( i, 2 ) == 0 )

  return
end
