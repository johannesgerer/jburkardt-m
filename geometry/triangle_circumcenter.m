function p = triangle_circumcenter ( n, t )

%*****************************************************************************80
%
%% TRIANGLE_CIRCUMCENTER computes the circumcenter of a triangle in ND.
%
%  Discussion:
%
%    Three ND points A, B and C lie on a circle.
%
%    The circumcenter P has the formula
%
%      P = ( Area ( PBC ) * A + Area ( APC) * B + Area ( ABP ) * C )
%        / ( Area ( PBC )     + Area ( APC )    + Area ( ABP ) )
%
%    The details of the formula rely on information supplied
%    by Oscar Lanzi III.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, real T(N,3), the triangle vertices.
%
%    Output, real P(N,1), the circumcenter of the triangle.
%
  a = r8vec_normsq_affine ( n, t(1:n,2), t(1:n,3) );
  b = r8vec_normsq_affine ( n, t(1:n,3), t(1:n,1) );
  c = r8vec_normsq_affine ( n, t(1:n,1), t(1:n,2) );

  pbc = a * ( - a + b + c );
  apc = b * (   a - b + c );
  abp = c * (   a + b - c );

  p = zeros ( n, 1 );

  p(1:n,1) = ( pbc * t(1:n,1) + apc * t(1:n,2) + abp * t(1:n,3) ) ...
           / ( pbc            + apc            + abp );

  return
end
