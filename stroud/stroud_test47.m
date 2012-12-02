function stroud_test47 ( )

%*****************************************************************************80
%
%% TEST47 tests TORUS_SQUARE_5C2, TORUS_SQUARE_14C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  global FUNC_3D_INDEX;

  r1 = 1.0;
  r2 = 0.125;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST47\n' );
  fprintf ( 1, '  For integrals inside a torus with square cross-section:\n' );
  fprintf ( 1, '  TORUS_SQUARE_5C2 approximates the integral;\n' );
  fprintf ( 1, '  TORUS_SQUARE_14C approximates the integral.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Inner radius = %f\n', r1 );
  fprintf ( 1, '  Outer radius = %f\n', r2 );
  fprintf ( 1, '  Volume = %f\n', torus_square_volume_3d ( r1, r2 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    F(X)    5C2           14C\n' );
  fprintf ( 1, '\n' );
 
  num = function_3d_num ( );

  for i = 1 : num

    FUNC_3D_INDEX = i;

    result1 = torus_square_5c2 ( 'function_3d', r1, r2 );
    result2 = torus_square_14c ( 'function_3d', r1, r2 );

    fname = function_3d_name ( i );

    fprintf ( 1, '  %s  %12f  %12f\n', fname, result1, result2 );

  end

  return
end
