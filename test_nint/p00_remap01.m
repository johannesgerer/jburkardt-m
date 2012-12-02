function xab = p00_remap01 ( problem, dim_num, n, x01 )

%*****************************************************************************80
%
%% P00_REMAP01 remaps points in [0,1]^DIM_NUM into [A(1:DIM_NUM),B(1:DIM_NUM)].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2007
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
%    Input, integer N, the number of points.
%
%    Input, real X01(DIM_NUM,N), the points, in [0,1], 
%    to be transformed.
%
%    Output, real XAB(DIM_NUM,N), the transformed points.
%
  [ a, b ] = p00_lim ( problem, dim_num );

  for i = 1 : dim_num
    xab(i,1:n) =  a(i) + ( b(i) - a(i) ) * x01(i,1:n);
  end

  return
end
