function volume = simplex_unit_volume ( dim_num )

%*****************************************************************************80
%
%% SIMPLEX_UNIT_VOLUME computes the volume of the unit simplex.
%
%  Discussion:
%
%    The formula is simple: volume = 1/N!.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Output, real VOLUME, the volume of the cone.
%
  volume = 1.0;
  for i = 1 : dim_num
    volume = volume / i;
  end

  return
end
