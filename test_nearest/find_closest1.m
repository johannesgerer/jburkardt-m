function nearest = find_closest1 ( m, nr, r, ns, s )

%*****************************************************************************80
%
%% FIND_CLOSEST1 finds the nearest R point to each S point.
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
%    22 October 2004
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
%    Output, integer NEAREST(NS), the index of the nearest cell generators.
%
  nearest = zeros ( ns, 1 );

  for js = 1 : ns

    distance = Inf;
    nearest(js) = -1;

    for jr = 1 : nr

      dist_sq = 0.0;
      for i = 1 : m
        dist_sq = dist_sq + ( r(i,jr) - s(i,js) )^2;
      end

      if ( dist_sq < distance )
        distance = dist_sq;
        nearest(js) = jr;
      end

    end

  end

  return
end
