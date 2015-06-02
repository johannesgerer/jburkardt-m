function nearest = find_closest ( ns, s, ng, g )

%*****************************************************************************80
%
%% FIND_CLOSEST finds the nearest G point to each S point.
%
%  Discussion:
%
%    Given two sets of points G and S, this function finds, for every
%    s in S, the index of the closest point g in G.
%
%    This procedure would seem to naturally require NG * NS operations,
%    and that is how this function is programmed.  However, for large
%    datasets, this cost can be prohibitive, and there are procedures
%    for preprocessing the dataset G that can greatly reduce this cost.
%
%    Modified in accordance with suggestions by Gene Cliff, 08 July 2010.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NS, the number of sample points.
%
%    Input, real S(2,NS), the points to be checked.
%
%    Input, integer NG, the number of cell generators.
%
%    Input, real G(2,NG), the cell generators.
%
%    Output, integer NEAREST(NS), the index of the cell generator nearest
%    to the sample point.
%
  ones_k = ones ( 1, ng );
  nearest = NaN ( 1, ns );

  for i = 1 : ns
    d1(1:2,1:ng) = g(1:2,1:ng) - s(1:2,i) * ones_k;
    d2 = sum ( d1 .* d1, 1 );
    [ min_val, min_loc ] = min ( d2 );
    nearest(i) = min_loc;
  end

  return
end
