function [ x, seed ] = uniform_walk ( dim_num, n, seed )

%*****************************************************************************80
%
%% UNIFORM_WALK generates points on a uniform random walk.
%
%  Discussion:
%
%    The first point is at the origin.  Uniform random numbers are
%    generated to determine the direction of the next step, which
%    is always of length 1, and in coordinate direction.
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
%    Input, integer DIM_NUM the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the points.
%
  x(1:dim_num,1) = 0.0;

  [ dir, seed ] = r8vec_uniform_01 ( n-1, seed );

  dir(1:n-1) = ( 2 * dim_num ) * ( dir(1:n-1) - 0.5 );

  for j = 2 : n

    x(1:dim_num,j) = x(1:dim_num,j-1);

    i = round ( abs ( dir(j-1) ) + 0.5 );
    i = min ( i, dim_num );
    i = max ( i, 1 );

    if ( dir(j-1) < 0.0 )
      x(i,j) = x(i,j) - 1.0;
    else
      x(i,j) = x(i,j) + 1.0;
    end

  end

  return
end
