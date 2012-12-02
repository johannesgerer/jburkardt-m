function result = p00_box_mc ( problem, dim_num, point_num )

%*****************************************************************************80
%
%% P00_BOX_MC integrates over an multi-dimensional box using Monte Carlo.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points to use.
%
%    Output, real RESULT, the approximate integral.
%

%
%  Get the volume.
%
  volume = p00_volume ( problem, dim_num );
%
%  Get the integration limits.
%
  [ a, b ] = p00_lim ( problem, dim_num );
%
%  Get the sample points.
%
  for dim = 1 : dim_num
    x(dim,1:point_num) = a(dim) + rand(1,point_num) * ( b(dim) - a(dim) );
  end
%
%  Evaluate the function.
%
  value = p00_f ( problem, dim_num, point_num, x );
%
%  Estimate the integral.
%
  result = sum ( value(1:point_num) ) * volume / point_num;

  return
end
