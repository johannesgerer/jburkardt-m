function value = index0123 ( i1_min, i1, i1_max, i2_min, i2, i2_max, i3_min, ...
  i3, i3_max, i4_min, i4, i4_max )

%*****************************************************************************80
%
%% INDEX0123 indexes a 4D array by columns, with a zero base.
%
%  Discussion:
%
%    Entries of the array are indexed starting at (I1_MIN,I2_MIN,I3_MIN,I4_MIN),
%    and increasing the initial index first, then the second, third and so on.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 November 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I1_MIN, I1, I1_MAX, for index 1,
%    the minimum, the index, and the maximum.
%
%    Input, integer I2_MIN, I2, I2_MAX, for index 2,
%    the minimum, the index, and the maximum.
%
%    Input, integer I3_MIN, I3, I3_MAX, for index 3,
%    the minimum, the index, and the maximum.
%
%    Input, integer I4_MIN, I4, I4_MAX, for index 4,
%    the minimum, the index, and the maximum.
%
%    Output, integer VALUE, the index of (I1,I2,I3,I4).
%
  index_min = 0;

  value = ...
      index_min ...
    + (         i1 - i1_min ) ...
    + ( i1_max + 1 - i1_min ) * (         i2 - i2_min ) ...
    + ( i1_max + 1 - i1_min ) * ( i2_max + 1 - i2_min ) ...
    * (         i3 - i3_min ) ...
    + ( i1_max + 1 - i1_min ) * ( i2_max + 1 - i2_min ) ...
    * ( i3_max + 1 - i3_min ) * (         i4 - i4_min );

  return
end
