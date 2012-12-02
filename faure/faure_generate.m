function r = faure_generate ( dim_num, n, skip )

%*****************************************************************************80
%
%% FAURE_GENERATE generates a Faure dataset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points to generate.
%
%    Input, integer SKIP, the number of initial points to skip.
%
%    Output, real  R(DIM_NUM,N), the points.
%
  base = prime_ge ( dim_num );

  r = zeros ( dim_num, n );

  seed = skip;

  for j = 1 : n
    [ r(1:dim_num,j), seed ] = faure ( dim_num, seed );
  end

  return
end
