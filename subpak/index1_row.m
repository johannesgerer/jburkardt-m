function value = index1_row ( i_min, i, i_max, index_min )

%*****************************************************************************80
%
%% INDEX1_ROW indexes a 1D vector by rows.
%
%  Discussion:
%
%    This 1D routine is provided primarily for analogy.
%    Moreover, in 1D there is no difference between row and column indexing.
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
%    Input, integer I_MIN, I, I_MAX, for the first index,
%    the minimum, the index, and the maximum.
%
%    Input, integer INDEX_MIN, the index of element I_MIN.
%    Typically, this is 0 or 1.
%
%    Output, integer VALUE, the index of element I.
%
  value = index_min + ( i - i_min );

  return
end
