function geometry_test051 ( )

%*****************************************************************************80
%
%% TEST051 tests PLANE_EXP2IMP_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST051\n' );
  fprintf ( 1, '  PLANE_EXP2IMP_3D puts a plane defined by\n' );
  fprintf ( 1, '    3 points into A*X+B*Y+C*Z+D = 0 form.\n' );
  fprintf ( 1, '\n' );

  p1(1:dim_num) = [  -1.0, 0.0, -1.0 ];
  p2(1:dim_num) = [  -4.0, 0.0,  0.0 ];
  p3(1:dim_num) = [ -20.0, 2.0,  4.0 ];
 
  [ a, b, c, d ] = plane_exp2imp_3d ( p1, p2, p3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P1, P2, P3:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %10f  %10f  %10f\n', p1(1:dim_num) );
  fprintf ( 1, '  %10f  %10f  %10f\n', p2(1:dim_num) );
  fprintf ( 1, '  %10f  %10f  %10f\n', p3(1:dim_num) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (A,B,C,D)= \n' );
  fprintf ( 1, '  %f  %f  %f  %f\n', a, b, c, d );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Correct answer is a multiple of 1, 2, 3, 4.\n' );
 
  p1(1:dim_num) = [ -16.0,  2.0, 4.0 ];
  p2(1:dim_num) = [   0.0,  0.0, 0.0 ];
  p3(1:dim_num) = [   4.0, -2.0, 0.0 ];
 
  [ a, b, c, d ] = plane_exp2imp_3d ( p1, p2, p3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P1, P2, P3:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %10f  %10f  %10f\n', p1(1:dim_num) );
  fprintf ( 1, '  %10f  %10f  %10f\n', p2(1:dim_num) );
  fprintf ( 1, '  %10f  %10f  %10f\n', p3(1:dim_num) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (A,B,C,D)= \n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %f  %f  %f  %f\n', a, b, c, d );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Correct answer is a multiple of 1, 2, 3, 0.\n' );
 
  return
end
