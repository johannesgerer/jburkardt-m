function [ x, seed ] = uniform_in_annulus_accept ( pc, r1, r2, n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_ANNULUS_ACCEPT accepts points in an annulus.
%
%  Discussion:
%
%    A circular annulus with center PC, inner radius R1 and
%    outer radius R2, is the set of points P so that
%
%      R1**2 <= (P(1)-PC(1))**2 + (P(2)-PC(2))**2 <= R2**2
%
%    The acceptance/rejection method is used.
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
%  Parameters:
%
%    Input, real PC(2), the center.
%
%    Input, real R1, R2, the inner and outer radii.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the points.
%
  dim_num = 2;

  if ( r2 <= r1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'UNIFORM_IN_ANNULUS_ACCEPT - Fatal error!\n' );
    fprintf ( 1, '  R2 <= R1.\n' );
    return
  end
%
%  Generate points in a square of "radius" R2.
%  Accept those points which lie inside the circle of radius R2, and outside
%  the circle of radius R1.
%
  for j = 1 : n

    while ( 1 )

      [ u, seed ] = r8vec_uniform_01 ( dim_num, seed );

      u(1:dim_num) = ( 2.0 * u(1:dim_num) - 1.0 ) * r2;

      if ( r1 * r1 <= sum ( u(1:dim_num).^2 ) & ...
        sum ( u(1:dim_num).^2 ) <= r2 * r2 )
        break
      end

    end

    x(1:dim_num,j) = ( pc(1:dim_num) + u(1:dim_num) )';

  end

  return
end
