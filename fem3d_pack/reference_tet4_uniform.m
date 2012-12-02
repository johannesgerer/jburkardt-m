function [ x, seed ] = reference_tet4_uniform ( n, seed )

%*****************************************************************************80
%
%% REFERENCE_TET4_UNIFORM: uniform sample points in the reference tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2009
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
  for j = 1 : n

    [ e, seed ] = r8vec_uniform_01 ( 4, seed );

    e(1:4) = - log ( e(1:4) );

    x(1:3,j) = e(1:3)' / sum ( e(1:4) );

  end

  return
end
