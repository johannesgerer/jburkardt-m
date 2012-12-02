function [ x, seed ] = uniform_on_simplex01_map ( dim_num, n, seed )

%*****************************************************************************80
%
%% UNIFORM_ON_SIMPLEX01_MAP maps uniform points onto the unit simplex.
%
%  Discussion:
%
%    The surface of the unit DIM_NUM-dimensional simplex is the set of points
%    X(1:DIM_NUM) such that each X(I) is nonnegative,
%    every X(I) is no greater than 1, and
%
%    ( X(I) = 0 for some I, or sum ( X(1:DIM_NUM) ) = 1. )
%
%    In DIM_NUM dimensions, there are DIM_NUM sides, and one main face.
%    This code picks a point uniformly with respect to "area".
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
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation, and Sensitivity
%    of Queueing Networks,
%    Wiley, 1986.
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
%  The construction begins by sampling DIM_NUM points from the
%  exponential distribution with parameter 1.
%
  for j = 1 : n

    [ e, seed ] = r8vec_uniform_01 ( dim_num, seed );

    e(1:dim_num) = -log ( e(1:dim_num) );
%
%  Based on their relative areas, choose a side of the simplex,
%  or the main face.
%
    x(1:dim_num,j) = e(1:dim_num)' / sum ( e(1:dim_num) );

    area1 = sqrt ( dim_num );

    area2 = dim_num;

    [ r, seed ] = r8_uniform_01 ( seed );

    if ( area1 / ( area1 + area2 ) < r )
      [ i, seed ] = i4_uniform ( 1, dim_num, seed );
      x(i,j) = 0.0;
    end

  end

  return
end
