function value = index3_col ( i_min, i, i_max, j_min, j, j_max, ...
  k_min, k, k_max, index_min )

%*****************************************************************************80
%
%% INDEX3_COL indexes a 3D array by columns.
%
%  Discussion:
%
%    Entries of the array are indexed starting at entry (I_MIN,J_MIN,K_MIN),
%    and increasing the row index first, then the column index.
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
%    Input, integer K_MIN, K, K_MAX, for plane indices,
%    the minimum, the index, and the maximum.
%
%    Input, integer INDEX_MIN, the index of (I_MIN,J_MIN,K_MIN).
%    Typically, this is 0 or 1.
%
%    Output, integer VALUE, the index of element (I,J,K).
%
  value = index_min ...
             + ( i - i_min ) ...
             + ( j - j_min ) * ( i_max + 1 - i_min ) ...
             + ( k - k_min ) * ( j_max + 1 - j_min ) * ( i_max + 1 - i_min );

  return
end
