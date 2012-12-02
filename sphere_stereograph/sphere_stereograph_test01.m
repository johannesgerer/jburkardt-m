function sphere_stereograph_test01 ( )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH_TEST01 checks that the two functions are inverses.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_STEREOGRAPH_TEST01\n' );
  fprintf ( 1, '  SPHERE_STEREOGRAPH maps from sphere to plane.\n' );
  fprintf ( 1, '  SPHERE_STEREOGRAPH_INVERSE is the inverse map.\n' );
  fprintf ( 1, '  Check that these two functions are inverses.\n' );

  m = 3;
  n = 100;
%
%  Check #1.
%
  seed = 123456789;
  p1 = uniform_on_sphere01_map ( m, n, seed );
  q = sphere_stereograph ( p1 );
  p2 = sphere_stereograph_inverse ( q );
  dif = sqrt ( sum ( ( p1 - p2 ).^2, 1 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Map points from sphere to plane to sphere.\n' );
  fprintf ( 1, '  Maximum difference for %d points was %f\n', n, max ( dif ) );
%
%  Check #2.
%
  q1 = zeros(m,n);
  q1(1:m-1,1:n) = rand ( m - 1, n );
  q1(m,1:n) = 1.0;

  p = sphere_stereograph_inverse ( q1 );
  q2 = sphere_stereograph ( p );

  dif = sqrt ( sum ( ( q1 - q2 ).^2, 1 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Map points from plane to sphere to plane.\n' );
  fprintf ( 1, '  Maximum difference for %d points was %f\n', n, max ( dif ) );

  return
end
