function [ x, seed ] = uniform_on_sphere01_map ( dim_num, n, seed )

%*****************************************************************************80
%
%% UNIFORM_ON_SPHERE01_MAP maps uniform points onto the unit sphere.
%
%  Discussion:
%
%    The sphere has center 0 and radius 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Russell Cheng,
%    Random Variate Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998, pages 168.
%
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation, and Sensitivity
%    of Queueing Networks,
%    Wiley, 1986, page 234.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the points.
%

%
%  Fast but proprietary to MATLAB.
%
  if ( 1 )

    x = randn ( dim_num, n );
%
%  Slow but portable.
%
  else

    [ x, seed ] = r8mat_normal_01 ( dim_num, n, seed );

  end

  v(1,1:n) = sqrt ( sum ( x.^2, 1 ) );
  vv = repmat ( v, dim_num, 1 );
  x = x ./ vv;

  return
end
