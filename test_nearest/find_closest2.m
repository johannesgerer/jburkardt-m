function nearest = find_closest2 ( m, nr, r, ns, s )

%*****************************************************************************80
%
%% FIND_CLOSEST2 finds the nearest R point to each S point.
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
%    Input, integer SN, the number of sample points.
%
%    Input, real S(M,NS), the points to be checked.
%
%    Output, integer NEAREST(NS), the index of the nearest cell generators.
%

%
%  Find nearest R to each S.
%
  nearest = zeros ( ns, 1 );

  for js = 1 : ns

    rs = sum ( ( r - repmat ( s(:,js), 1, nr ) ).^2 );

    [ dummy, nearest(js) ] = min ( rs );

  end

  return
end
