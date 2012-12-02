function value = index0n ( n, i_min, i, i_max )

%*****************************************************************************80
%
%% INDEX0N indexes an N-dimensional array by columns, with zero base.
%
%  Discussion:
%
%    Entries of the array are indexed starting at entry
%      ( I_MIN(1), I_MIN(2),...,I_MIN(N) ),
%    and increasing the first index up to I_MAX(1),
%    then the second and so on.
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
%    Input, integer N, the number of indices.
%
%    Input, integer I_MIN(N), the minimum indices.
%
%    Input, integer I(N), the indices.
%
%    Input, integer I_MAX(N), for maximum indices.
%
%    Output, integer VALUE, the index of element I.
%
  index_min = 0;

  value = ( i(n) - i_min(n) );

  for j = n - 1 : -1 : 1
    value = value * ( i_max(j) + 1 - i_min(j) ) + ( i(j) - i_min(j) );
  end
  value = value + index_min;

  return
end
