function sphere_stereograph_test02 ( )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH_TEST02 checks the generalized mapping.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_STEREOGRAPH_TEST02\n' );
  fprintf ( 1, '  SPHERE_STEREOGRAPH standard mapping from sphere to plane.\n' );
  fprintf ( 1, '  SPHERE_STEREOGRAPH2 generalized mapping:\n' );
  fprintf ( 1, '  (focus and center are arbitrary)\n' );
  fprintf ( 1, '  Check that these two functions can agree.\n' );

  m = 3;
  n = 100;

  focus = [ 0, 0, -1 ]';
  center = [ 0, 0, 0 ]';
%
%  Check #1.
%
  seed = 123456789;
  p1 = uniform_on_sphere01_map ( m, n, seed );

  q1 = sphere_stereograph ( p1 );

  q2 = sphere_stereograph2 ( p1, focus, center );

  dif = sqrt ( sum ( ( q1 - q2 ).^2, 1 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Map points from sphere to plane.\n' );
  fprintf ( 1, '  Maximum difference for %d points was %f\n', n, max ( dif ) );
%
%  Check #2.
%
  q1 = zeros(m,n);
  q1(1:m-1,1:n) = rand ( m - 1, n );
  q1(m,1:n) = 1.0;

  p1 = sphere_stereograph_inverse ( q1 );

  p2 = sphere_stereograph2_inverse ( q1, focus, center );

  dif = sqrt ( sum ( ( p1 - p2 ).^2, 1 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Map points from plane to sphere.\n' );
  fprintf ( 1, '  Maximum difference for %d points was %f\n', n, max ( dif ) );

  return
end
