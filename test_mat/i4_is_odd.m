function value = i4_is_odd ( i )

%*****************************************************************************80
%
%% I4_IS_ODD returns TRUE if I is odd.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the integer to be tested.
%
%    Output, logical VALUE, is TRUE if I is odd.
%
  value = ( mod ( i+1, 2 ) == 0 );

  return
end
