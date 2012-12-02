function geometry_test039 ( )

%*****************************************************************************80
%
%% TEST039 tests LINES_EXP_INT_2D.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST039\n' );
  fprintf ( 1, '  LINES_EXP_INT_2D finds intersections of\n' );
  fprintf ( 1, '    two explicit lines in 2D.\n' );
  fprintf ( 1, '\n' );

  for itest = 1 : 3
%
%  x + 2y - 4 = 0
%  x - y - 1 = 0
%
    if ( itest == 1 )

      p1(1:2,1) = [ 0.0;  2.0 ];
      p2(1:2,1) = [ 4.0;  0.0 ];
      q1(1:2,1) = [ 0.0; -1.0 ];
      q2(1:2,1) = [ 1.0;  0.0 ];
%
%  x + 2y - 4 = 0
%  2x + 4y - 1 = 0
%
    elseif ( itest == 2 )

      p1(1:2,1) = [ 0.00; 2.00 ];
      p2(1:2,1) = [ 4.00; 0.00 ];
      q1(1:2,1) = [ 0.00; 0.25 ];
      q2(1:2,1) = [ 0.50; 0.00 ];
%
%  x + 2y - 4 = 0
%  -3x - 6y +12 = 0
%
    elseif ( itest == 3 )

      p1(1:2,1) = [ 0.0; 2.0 ];
      p2(1:2,1) = [ 4.0; 0.0 ];
      q1(1:2,1) = [ 0.0; 2.0 ];
      q2(1:2,1) = [ 4.0; 0.0 ];

    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  P1  %8f  %8f\n', p1(1:2,1) );
    fprintf ( 1, '  P2  %8f  %8f\n', p2(1:2,1) );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Q1  %8f  %8f\n', q1(1:2,1) );
    fprintf ( 1, '  Q2  %8f  %8f\n', q2(1:2,1) );

    [ ival, p ] = lines_exp_int_2d ( p1, p2, q1, q2 );

    if ( ival == 1 )
      fprintf ( 1, '  Intersection at %8f  %8f\n', p(1:2,1) );
    elseif ( ival == 0 )
      fprintf ( 1, '  Lines are parallel, no intersection.\n' );
    elseif ( ival == 2 )
      fprintf ( 1, '  Lines are coincident.\n' );
    else
      fprintf ( 1, '  Unknown return value of IVAL = %d\n', ival );
    end

  end

  return
end
