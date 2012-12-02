function value = index01 ( i_min, i, i_max, j_min, j, j_max )

%*****************************************************************************80
%
%% INDEX01 indexes a 2D array by columns, with a zero base.
%
%  Discussion:
%
%    Entries of the array are indexed starting at entry (I_MIN,J_MIN),
%    and increasing the row index first.
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
%    Input, integer I_MIN, I, I_MAX, for row indices,
%    the minimum, the index, and the maximum.
%
%    Input, integer J_MIN, J, J_MAX, for column indices,
%    the minimum, the index, and the maximum.
%
%    Output, integer VALUE, the index of element (I,J).
%
  index_min = 0;

  value = ...
    index_min ...
    + (         i - i_min ) ...
    + ( i_max + 1 - i_min ) * ( j - j_min );

  return
end
