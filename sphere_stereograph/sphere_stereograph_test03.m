function sphere_stereograph_test03 ( )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH_TEST03 checks that the two functions are inverses.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_STEREOGRAPH_TEST03\n' );
  fprintf ( 1, '  SPHERE_STEREOGRAPH2 maps from sphere to plane.\n' );
  fprintf ( 1, '  SPHERE_STEREOGRAPH2_INVERSE is the inverse map.\n' );
  fprintf ( 1, '  Check that these two functions are inverses.\n' );

  m = 3;
  n = 100;
  seed = 123456789;

  [ focus, seed ] = r8vec_uniform_01 ( m, seed );
  [ center, seed ] = r8vec_uniform_01 ( m, seed );
  r = norm ( focus - center );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using radius = %f\n', r );
  fprintf ( 1, '  center = (%f,%f,%f)\n', center );
  fprintf ( 1, '  focus =  (%f,%f,%f)\n', focus );
%
%  Check #1.
%
  p1 = uniform_on_sphere01_map ( m, n, seed );
  p1 = repmat ( center, 1, n ) + r * p1;

  q = sphere_stereograph2 ( p1, focus, center );

  p2 = sphere_stereograph2_inverse ( q, focus, center );

  dif = sqrt ( sum ( ( p1 - p2 ).^2, 1 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Map points from sphere to plane to sphere.\n' );
  fprintf ( 1, '  Maximum difference for %d points was %f\n', n, max ( dif ) );
%
%  Check #2.
%  We have to work hard to get random points on the plane, since
%  all we know to begin with is the point of tangency and the normal.
%
  tang = 2 * center - focus;
  normal = center - focus;
  [ pr, pq ] = plane_normal_basis_3d ( tang, normal );
  q1 = zeros(m,n);
  alpha = rand(1,n);
  beta = rand(1,n);
  tt = repmat ( tang, 1, n );

  q1(1:m,1:n) = tt + pr(1:m,1) * alpha(1,1:n) + pq(1:m,1) * beta(1,1:n);
  p = sphere_stereograph2_inverse ( q1, focus, center );
  q2 = sphere_stereograph2 ( p, focus, center );

  dif = sqrt ( sum ( ( q1 - q2 ).^2, 1 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Map points from plane to sphere to plane.\n' );
  fprintf ( 1, '  Maximum difference for %d points was %f\n', n, max ( dif ) );

  return
end
