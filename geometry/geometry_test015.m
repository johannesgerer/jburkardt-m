function geometry_test015 ( )

%*****************************************************************************80
%
%% TEST015 tests CIRCLE_EXP2IMP_2D, TRIANGLE_CIRCUMCIRCLE_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST015\n' );
  fprintf ( 1, '  CIRCLE_EXP2IMP_2D computes the radius and \n' );
  fprintf ( 1, '  center of the circle through three points.\n' );
  fprintf ( 1, '  TRIANGLE_CIRCUMCIRCLE_2D computes the radius and \n' );
  fprintf ( 1, '  center of the circle through the vertices of\n' );
  fprintf ( 1, '  a triangle.\n' );

  p1test(1:2,1:n) = [ ...
    4.0, 2.0; ...
    1.0, 5.0; ...
   -2.0, 2.0 ]';

  p2test(1:2,1:n) = [ ...
    4.0, 2.0; ...
    5.0, 4.0; ...
    6.0, 6.0 ]';

  p3test(1:2,1:n) = [ ...
    4.0, 2.0; ...
    1.0, 5.0; ...
    4.0, 2.0 ]';

  for i = 1 : n

    p1(1:2,1) = p1test(1:2,i);
    p2(1:2,1) = p2test(1:2,i);
    p3(1:2,1) = p3test(1:2,i);

    r8vec_print ( 2, p1, '  P1:' );
    r8vec_print ( 2, p2, '  P2:' );
    r8vec_print ( 2, p3, '  P3:' );

    [ r, center ] = circle_exp2imp_2d ( p1, p2, p3 );

    circle_imp_print_2d ( r, center, '  The implicit circle:' )

    t(1:2,1:3) = [ p1(1:2,1)'; p2(1:2,1)'; p3(1:2,1)' ]';

    [ r, center ] = triangle_circumcircle_2d ( t );

    circle_imp_print_2d ( r, center, '  The triangle''s circumcircle:' )

  end

  return
end
