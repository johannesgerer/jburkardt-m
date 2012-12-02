function stroud_test18 ( )

%*****************************************************************************80
%
%% TEST18 tests CUBE_SHELL_ND.
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
  global FUNC_ND_INDEX;

  n_max = 4;
  num = function_nd_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST18\n' );
  fprintf ( 1, '  CUBE_SHELL_ND approximates integrals in a\n' );
  fprintf ( 1, '    cubical shell in ND.\n' );
  fprintf ( 1, '\n' );

  r1 = 0.0;
  r2 = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Inner radius = %f\n', r1 );
  fprintf ( 1, '  Outer radius = %f\n', r2 );
  fprintf ( 1, '\n' );
 
  for n = 2 : n_max
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
    fprintf ( 1, '  Volume = %d\n', cube_shell_volume_nd ( n, r1, r2 ) );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    F(X)      CUBE_SHELL_ND\n' );
    fprintf ( 1, '\n' );
 
    for i = 1 : num

      FUNC_ND_INDEX = i;

      result = cube_shell_nd ( 'function_nd', n, r1, r2 );

      fname = function_nd_name ( i );

      fprintf ( 1, '  %s  %12f\n', fname, result );

    end

  end
 
  r1 = 1.0;
  r2 = 2.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Inner radius = %f\n', r1 );
  fprintf ( 1, '  Outer radius = %f\n', r2 );
  fprintf ( 1, '\n' );
 
  for n = 2 : n_max
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
    fprintf ( 1, '  Volume = %f\n', cube_shell_volume_nd ( n, r1, r2 ) );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  F(X)      CUBE_SHELL_ND\n' );
    fprintf ( 1, '\n' );
 
    for i = 1 : num

      FUNC_ND_INDEX = i;

      result = cube_shell_nd ( 'function_nd', n, r1, r2 );

      fname = function_nd_name ( i );

      fprintf ( 1, '  %s  %12f\n', fname, result );

    end
 
  end
 
  return
end
