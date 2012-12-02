function [ x, seed ] = bad_in_simplex01 ( dim_num, point_num, seed )

%*****************************************************************************80
%
%% BAD_IN_SIMPLEX01 is a "bad" (nonuniform) sampling of the unit simplex.
%
%  Discussion:
%
%    The interior of the unit DIM_NUM-dimensional simplex is the set of
%    points X(1:DIM_NUM) such that each X(I) is nonnegative, and
%    sum(X(1:DIM_NUM)) <= 1.
%
%    Any point in the unit simplex CAN be chosen by this algorithm.
%
%    However, the points that are chosen tend to be clustered near
%    the centroid.
%
%    This routine is supplied as an example of "bad" sampling.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real X(DIM_NUM,POINT_NUM), the points.
%
  for j = 1 : point_num

    [ e, seed ] = r8vec_uniform_01 ( dim_num + 1, seed );

    e_sum = sum ( e(1:dim_num+1) );

    e(1:dim_num+1) = e(1:dim_num+1) / e_sum;
%
%  We may take the values E(1:DIM_NUM+1) as being the barycentric
%  coordinates of the point.
%
    x(1:dim_num,j) = e(1:dim_num);

  end

  return
end
