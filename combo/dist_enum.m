function num_dist = dist_enum ( k, m )

%*****************************************************************************80
%
%% DIST_ENUM returns the number of distributions of indistinguishable objects.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer K, the number of distinguishable "slots".
%
%    Input, integer M, the number of indistinguishable objects.
%
%    Output, integer NUM_DIST, the number of distributions of M
%    indistinguishable objects about K distinguishable slots.
%
  cnk = combin ( m + k - 1, m );

  num_dist = round ( cnk );

  return
end
