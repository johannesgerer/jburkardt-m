function geometry_test066 ( )

%*****************************************************************************80
%
%% TEST066 tests POINTS_COLIN_2D.
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
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST066\n' );
  fprintf ( 1, '  POINTS_COLIN_2D estimates the colinearity\n' );
  fprintf ( 1, '    of three points.\n' );

  p1(1:dim_num) = [  0.0,  0.0 ];
  p2(1:dim_num) = [ 10.0, 10.0 ];
  p3(1:dim_num) = [  5.0,  4.99 ];

  colin = points_colin_2d ( p1, p2, p3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Points almost on a line:\n' );
  fprintf ( 1, '  Expect COLIN to be close to 0\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12f  %12f  %12f\n', p1(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p2(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p3(1:dim_num) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Colinearity index = %f\n', colin );
 
  p1(1:dim_num) = [   0.0, 0.0 ];
  p2(1:dim_num) = [   0.0, 1.0 ];
  p3(1:dim_num) = [ 100.0, 0.0 ];

  colin = points_colin_2d ( p1, p2, p3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Two points close, one far:\n' );
  fprintf ( 1, '  Expect COLIN to be close to 0\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12f  %12f  %12f\n', p1(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p2(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p3(1:dim_num) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Colinearity index = %f\n', colin );

  p1(1:dim_num) = [ 0.0, 0.0 ];
  p2(1:dim_num) = [ 1.0, 0.0 ];
  p3(1:dim_num) = [ 0.5, 0.86602539 ];

  colin = points_colin_2d ( p1, p2, p3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Points on an equilateral triangle:\n' );
  fprintf ( 1, '  Expect COLIN to be close to 1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12f  %12f  %12f\n', p1(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p2(1:dim_num) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p3(1:dim_num) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Colinearity index = %f\n', colin );

  return
end
