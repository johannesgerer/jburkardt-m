function geometry_test044 ( )

%*****************************************************************************80
%
%% TEST044 tests SEGMENTS_INT_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 7;

  q1_test = [ -1.0, 3.0, 1.0,  0.5, 0.25, 0.5, 2.0 ];
  q2_test = [  1.0, 2.0, 2.0, -3.0, 0.50, 0.5, 2.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST044\n' );
  fprintf ( 1, '  SEGMENTS_INT_1D determines the intersection [R1,R2]\n' );
  fprintf ( 1, '  of line segments [P1,P2] and [Q1,Q2] in 1D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIST is negative for overlap,\n' );
  fprintf ( 1, '  0 for point intersection,\n' );
  fprintf ( 1, '  positive if there is no overlap.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  Test      P1        P2        Q1        Q2        R1        R2        DIST\n' );
  fprintf ( 1, '\n' );

  p1 = -1.0;
  p2 = 1.0;

  for test = 1 : test_num

    q1 = q1_test(test);
    q2 = q2_test(test);

    [ dist, r1, r2 ] = segments_int_1d ( p1, p2, q1, q2 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8f  %8f  %8f  %8f\n', ...
      test, p1, p2, q1, q2, r1, r2, dist );

  end

  return
end
