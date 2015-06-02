function nearest = find_closest3 ( m, nr, r, ns, s )

%*****************************************************************************80
%
%% FIND_CLOSEST3 finds the nearest R point to each S point.
%
%  Discussion:
%
%    We are given R, a set of NR points in M dimensions.
%
%    We are given S, a set of NS points in M dimensions.
%
%    For each S(I) in S, we seek the index J of the point R(J)
%    which is nearest to S(I) over all points in R.
%
%    Modified in accordance with suggestions by Gene Cliff, 08 July 2010.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer NR, the number of cell generators.
%
%    Input, real R(M,NR), the cell generators.
%
%    Input, integer NS, the number of sample points.
%
%    Input, real S(M,NS), the points to be checked.
%
%    Output, integer NEAREST(NS), the index of the cell generator nearest
%    to the sample point.
%
  ones_k = ones ( 1, nr );
  nearest = NaN ( 1, ns );

  for i = 1 : ns
    d1 = r - s(:,i) * ones_k;
    d2 = sum ( d1 .* d1 );
    [ min_val, min_loc ] = min ( d2 );
    nearest(i) = min_loc;
  end

  return
end
