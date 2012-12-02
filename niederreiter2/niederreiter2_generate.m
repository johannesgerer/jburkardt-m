function [ r, seed ] = niederreiter2_generate ( dim_num, n, seed )

%*****************************************************************************80
%
%% NIEDERREITER2_GENERATE generates a set of Niederreiter values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points desired.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real R(DIM_NUM,N), the points.
%
  r = zeros(dim_num,n);

  for j = 1 : n
    [ r(1:dim_num,j), seed ] = niederreiter2 ( dim_num, seed );
  end

  return
end
