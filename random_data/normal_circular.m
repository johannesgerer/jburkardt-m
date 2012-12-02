function [ x, seed ] = normal_circular ( dim_num, n, seed )

%*****************************************************************************80
%
%% NORMAL_CIRCULAR creates circularly normal points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964, page 936.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space, which must be 2.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the points.
%

%
%  The angle varies uniformly from 0 to 2 pi.
%
  [ t, seed ] = r8vec_uniform_01 ( n, seed );

  t(1:n) = 2.0 * pi * t(1:n);
%
%  The radius is normally distributed.
%
  [ r, seed ] = r8vec_normal_01 ( n, seed );

  x(1,1:n) = r(1:n) .* cos ( t(1:n) );
  x(2,1:n) = r(1:n) .* sin ( t(1:n) );

  return
end
