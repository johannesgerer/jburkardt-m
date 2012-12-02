function test003 ( )

%*****************************************************************************80
%
%% TEST003 tests ANGLE_MEAN;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST003\n' );
  fprintf ( 1, '  For the ANGLE PDF:\n' );
  fprintf ( 1, '  ANGLE_MEAN computes the mean;\n' );

  n = 5;
  mean = angle_mean ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter N = %6d\n', n );
  fprintf ( 1, '  PDF mean =        %14f\n', mean );

  return
end
