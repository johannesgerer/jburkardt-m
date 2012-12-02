function stroud_test46 ( )

%*****************************************************************************80
%
%% TEST46 tests TORUS_5S2, TORUS_6S2, TORUS_14S.
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

  r1 = 0.5;
  r2 = 1.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST46\n' );
  fprintf ( 1, '  For the interior of a torus,\n' );
  fprintf ( 1, '  TORUS_5S2,\n' );
  fprintf ( 1, '  TORUS_6S2, and\n' );
  fprintf ( 1, '  TORUS_5S2 approximate integrals.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Inner radius = %f\n', r1 );
  fprintf ( 1, '  Outer radius = %f\n', r2 );
  fprintf ( 1, '  Volume = %f\n', torus_volume_3d ( r1, r2 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Rule:        #5S2          #6S2          #14S\n' );
  fprintf ( 1, '    F(X)\n' );
  fprintf ( 1, '\n' );
 
  num = function_3d_num ( );

  for i = 1 : num

    FUNC_3D_INDEX = i;

    result1 = torus_5s2 ( 'function_3d', r1, r2 );
    result2 = torus_6s2 ( 'function_3d', r1, r2 );
    result3 = torus_14s ( 'function_3d', r1, r2 );

    fname = function_3d_name ( i );

    fprintf ( 1, '  %s  %12f  %12f  %12f\n', fname, result1, result2, result3 );

  end
 
  return
end

