function value = index2_row ( i_min, i, i_max, j_min, j, j_max, index_min )

%*****************************************************************************80
%
%% INDEX2_ROW indexes a 2D array by row.
%
%  Discussion:
%
%    Entries of the array are indexed starting at entry (I_MIN,J_MIN),
%    and increasing the column index first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 April 2010
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
%    Input, integer INDEX_MIN, the index of element (I_MIN,J_MIN).
%    Typically, this is 0 or 1.
%
%    Output, integer VALUE, the index of element (I,J).
%
  value = index_min + ( j - j_min ) + ( i - i_min ) * ( j_max + 1 - j_min );

  return
end
