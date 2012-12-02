function value = i4_even ( i )

%*****************************************************************************80
%
%% I4_EVEN returns TRUE if I is even.
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
%    Output, logical VALUE, is TRUE if I is even.
%
  value = ( mod ( i, 2 ) == 0 );

  return
end
