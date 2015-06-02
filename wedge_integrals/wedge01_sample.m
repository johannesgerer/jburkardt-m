function [ x, seed ] = wedge01_sample ( n, seed )

%*****************************************************************************80
%
%% WEDGE01_SAMPLE samples points uniformly from the unit wedge in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation, and Sensitivity 
%    of Queueing Networks,
%    Krieger, 1992,
%    ISBN: 0894647644,
%    LC: QA298.R79.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real X(3,N), the points.
%
  x = zeros ( 3, n );

  for j = 1 : n

    [ e, seed ] = r8vec_uniform_01 ( 4, seed );

    e(1:3) = - log ( e(1:3) );

    e_sum = sum ( e(1:3) );

    x(1,j) = e(1,1) / e_sum;
    x(2,j) = e(2,1) / e_sum;
    x(3,j) = 2.0 * e(4) - 1.0;

  end

  return
end
