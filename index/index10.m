function value = index10 ( i_min, i, i_max, j_min, j, j_max )

%*****************************************************************************80
%
%% INDEX10 indexes a 2D array by rows, with a zero base.
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

  value = index_min ...
             +                         ( j - j_min ) ...
             + ( i - i_min ) * ( j_max + 1 - j_min );

  return
end
