function geometry_test045 ( )

%*****************************************************************************80
%
%% TEST045 tests SEGMENTS_INT_2D.
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
  ntest = 4;

  q1_test = [ ...
    -1.0,  1.0; ...
     3.0, -1.0; ...
     0.0,  0.0; ...
     1.0,  2.0 ]';
  q2_test = [ ...
    1.0, -1.0; ...
    2.0,  0.0; ...
    0.0,  9.0; ...
    3.0,  2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST045\n' );
  fprintf ( 1, '  SEGMENTS_INT_2D searches for an intersection of two\n' );
  fprintf ( 1, '  line segments in 2D.\n' );

  p1(1:2,1) = [ -1.0; 3.0 ];
  p2(1:2,1) = [  1.0; 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  All tests use the same line segment 1:\n' );
  fprintf ( 1, '  P1 = %8f  %8f\n', p1(1:2,1) );
  fprintf ( 1, '  P2 = %8f  %8f\n', p2(1:2,1) );

  for i = 1 : ntest

    q1(1:2,1) = q1_test(1:2,i);
    q2(1:2,1) = q2_test(1:2,i);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Q1 = %8f  %8f\n', q1(1:2,1) );
    fprintf ( 1, '  Q2 = %8f  %8f\n', q2(1:2,1) );

    [ flag, r ] = segments_int_2d ( p1, p2, q1, q2 );

    if ( flag == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  The line segments do not intersect.\n' );
    elseif ( flag == 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  The line segments intersect at:\n' );
      fprintf ( 1, '  %8f  %8f\n', r(1:2,1) );
    end

  end

  return
end
