function nearest = find_closest ( dn, gn, sn, s, g )

%*****************************************************************************80
%
%% FIND_CLOSEST finds the nearest G point to each S point.
%
%  Discussion:
%
%    Given two sets of points G and S, this function finds, for every
%    s in S, the index of the closest point g in G.
%
%    This procedure would seem to naturally require GN * SN operations,
%    and that is how this function is programmed.  However, for large
%    datasets, this cost can be prohibitive, and there are procedures
%    for preprocessing the dataset G that can greatly reduce this cost.
%
%    Modified in accordance with suggestions by Gene Cliff, 08 July 2010.
%
%    Modified yet again to deal with the special case of DN = 1,
%    15 September 2010.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DN, the spatial dimension.
%
%    Input, integer GN, the number of cell generators.
%
%    Input, integer SN, the number of sample points.
%
%    Input, real S(DN,SN), the points to be checked.
%
%    Input, real G(DN,GN), the cell generators.
%
%    Output, integer NEAREST(SN), the index of the cell generator nearest
%    to the sample point.
%
  ones_k = ones ( 1, gn );
  nearest = NaN ( 1, sn );

  for i = 1 : sn
    d1(1:dn,1:gn) = g(1:dn,1:gn) - s(1:dn,i) * ones_k;
    d2 = sum ( d1 .* d1, 1 );
    [ min_val, min_loc ] = min ( d2 );
    nearest(i) = min_loc;
  end

  return
end
