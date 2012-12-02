function nksub = ksubset_enum ( k, n )

%*****************************************************************************80
%
%% KSUBSET_ENUM enumerates the K element subsets of an N set.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer K, the number of elements each K subset must
%    have. 0 <= K <= N.
%
%    Input, integer N, the number of elements in the master set.
%    0 <= N.
%
%    Output, integer NKSUB, the number of distinct elements.
%
  nksub = binomial ( n, k );

  return
end
