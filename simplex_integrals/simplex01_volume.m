function volume = simplex01_volume ( m )

%*****************************************************************************80
%
%% SIMPLEX01_VOLUME returns the volume of the unit simplex in M dimensions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Output, real VOLUME, the volume.
%
  volume = 1.0;
  for i = 1 : m
    volume = volume / i;
  end

  return
end
