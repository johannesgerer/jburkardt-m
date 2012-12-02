function [ j1, j2 ] = i4i4_sort_a ( i1, i2 )

%*****************************************************************************80
%
%% I4I4_SORT_A ascending sorts a pair of integers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I1, I2, the values to sort.
%
%    Output, integer J1, J2, the sorted values.
%
  j1 = min ( i1, i2 );
  j2 = max ( i1, i2 );

  return
end
