function value = indexn_row ( n, i_min, i, i_max, index_min )

%*****************************************************************************80
%
%% INDEXN_ROW indexes an ND array by rows.
%
%  Discussion:
%
%    Entries of the array are indexed starting at entry
%      ( I_MIN(1), I_MIN(2),...,I_MIN(N) ),
%    and increasing the last index up to I_MAX(N),
%    then the next-to-last and so on.
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
%    Input, integer N, the number of indices.
%
%    Input, integer I_MIN(N), the minimum indices.
%
%    Input, integer I(N), the indices.
%
%    Input, integer I_MAX(N), for maximum indices.
%
%    Input, integer INDEX_MIN, the index of
%    ( I_MIN(1), I_MIN(2),...,I_MIN(N) ).  Typically, this is 0 or 1.
%
%    Output, integer VALUE, the index of element I.
%
  value = ( i(1) - i_min(1) );

  for j = 2 : n
    value = value * ( i_max(j) + 1 - i_min(j) ) + ( i(j) - i_min(j) );
  end
  value = value + index_min;

  return
end
