function [ x, seed ] = ball_unit_sample_nd ( n, seed )

%*****************************************************************************80
%
%% BALL_UNIT_SAMPLE_ND picks a random point in the unit ball in ND.
%
%  Discussion:
%
%    N-1 random Givens rotations are applied to the point ( 1, 0, 0, ..., 0 ).
%
%    The I-th Givens rotation is in the plane of coordinate axes I and I+1,
%    and has the form:
%
%     [ cos ( theta )  - sin ( theta ) ] * x(i)      = x'(i)
%     [ sin ( theta )    cos ( theta ) ]   x(i+1)      x'(i+1)
%
%    Finally, a scaling is applied to set the point at a distance R
%    from the center, in a way that results in a uniform distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(N), the random point.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  x(1) = 1.0;
  x(2:n) = 0.0;

  for i = 1 : n-1

    [ r, seed ] = r8_uniform_01 ( seed );
    random_cosine = 2.0 * r - 1.0;
    [ r, seed ] = r8_uniform_01 ( seed );
    random_sign = 2 * floor ( 2.0 * r ) - 1;
    [ r, seed ] = r8_uniform_01 ( seed );
    random_sine = random_sign * sqrt ( 1.0 - random_cosine * random_cosine );

    xi = x(i);
    x(i  ) = random_cosine * xi;
    x(i+1) = random_sine   * xi;

  end

  [ r, seed ] = r8_uniform_01 ( seed );

  r = r^( 1.0 / n );

  x(1:n) = r * x(1:n);

  return
end
