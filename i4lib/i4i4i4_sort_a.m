function [ j1, j2, j3 ] = i4i4i4_sort_a ( i1, i2, i3 )

%*****************************************************************************80
%
%% I4I4I4_SORT_A ascending sorts a triple of integers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I1, I2, I3, the values to sort.
%
%    Output, integer J1, J2, J3, the sorted values.
%
  j1 = min ( min ( i1, i2 ), min ( i2, i3 ) );
  j2 = min ( max ( i1, i2 ), ...
       min ( max ( i2, i3 ), max ( i3, i1 ) ) );
  j3 = max ( max ( i1, i2 ), max ( i2, i3 ) );

  return
end
