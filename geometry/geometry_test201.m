function geometry_test201 ( )

%*****************************************************************************80
%
%% TEST201 tests STRING_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%

  dim_num = 2;
  nvec = 15;

  i = 0;

  i = i+1;
  p1(1,i) = 0.0;
  p1(2,i) = 0.0;
  p2(1,i) = 1.0;
  p2(2,i) = 1.0;
 
  i = i+1;
  p1(1,i) = 3.0;
  p1(2,i) = 4.0;
  p2(1,i) = 2.0;
  p2(2,i) = 4.0;
 
  i = i+1;
  p1(1,i) = 2.0;
  p1(2,i) = 2.0;
  p2(1,i) = 1.0;
  p2(2,i) = 3.0;
 
  i = i+1;
  p1(1,i) = 3.0;
  p1(2,i) = 2.0;
  p2(1,i) = 2.0;
  p2(2,i) = 3.0;
 
  i = i+1;
  p1(1,i) = 2.0;
  p1(2,i) = 1.0;
  p2(1,i) = 2.0;
  p2(2,i) = 2.0;
 
  i = i+1;
  p1(1,i) = 1.0;
  p1(2,i) = 1.0;
  p2(1,i) = 1.0;
  p2(2,i) = 2.0;
 
  i = i+1;
  p1(1,i) = 0.0;
  p1(2,i) = 5.0;
  p2(1,i) = 1.0;
  p2(2,i) = 6.0;
 
  i = i+1;
  p1(1,i) = 1.0;
  p1(2,i) = 2.0;
  p2(1,i) = 1.0;
  p2(2,i) = 3.0;
 
  i = i+1;
  p1(1,i) = 3.0;
  p1(2,i) = 2.0;
  p2(1,i) = 3.0;
  p2(2,i) = 3.0;
 
  i = i+1;
  p1(1,i) = 0.0;
  p1(2,i) = 0.0;
  p2(1,i) = 1.0;
  p2(2,i) = 0.0;
 
  i = i+1;
  p1(1,i) = 5.0;
  p1(2,i) = 5.0;
  p2(1,i) = 6.0;
  p2(2,i) = 6.0;
 
  i = i+1;
  p1(1,i) = 3.0;
  p1(2,i) = 3.0;
  p2(1,i) = 3.0;
  p2(2,i) = 4.0;
 
  i = i+1;
  p1(1,i) = 2.0;
  p1(2,i) = 4.0;
  p2(1,i) = 2.0;
  p2(2,i) = 3.0;
 
  i = i+1;
  p1(1,i) = 7.0;
  p1(2,i) = 4.0;
  p2(1,i) = 5.0;
  p2(2,i) = 5.0;
 
  i = i+1;
  p1(1,i) = 1.0;
  p1(2,i) = 0.0;
  p2(1,i) = 2.0;
  p2(2,i) = 1.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST201\n' );
  fprintf ( 1, '  STRING_2D takes a set of line segments, and\n' );
  fprintf ( 1, '    "strings" them together.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, (X1,Y1), (X2,Y2)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nvec
    fprintf ( 1, '  %6d  %12f  %12f  %12f  %12f\n', i, p1(1:2,i), p2(1:2,i) );
  end
 
  [ p1, p2, nstrng, order, string ] = string_2d ( nvec, p1, p2 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Found %d groups of segments.\n', nstrng );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  STRING, ORDER, P1, P2\n' );
  fprintf ( 1, '\n' );

  jstrng = 1;

  for i = 1 : nvec
 
    if ( jstrng < string(i) )
      fprintf ( 1, '\n' );
      jstrng = jstrng + 1;
    end
 
    fprintf ( 1, '  %3d  %3d  %8f  %8f  %8f  %8f\n', ...
      string(i), order(i), p1(1:2,i), p2(1:2,i) );

  end
