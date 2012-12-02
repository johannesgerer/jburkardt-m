function stroud_test32 ( )

%*****************************************************************************80
%
%% TEST32 tests SPHERE_05_ND, SPHERE_07_1_ND.
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

  n_max = 5;

  num = function_nd_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST32\n' );
  fprintf ( 1, '  For integrals on a sphere in ND:\n' );
  fprintf ( 1, '  SPHERE_05_ND uses a formula of degree 5.\n' );
  fprintf ( 1, '  SPHERE_07_1_ND uses a formula of degree 7.\n' );
  fprintf ( 1, '\n' );

  r = 2.0;
  xc(1:n_max) = 1.0;

  for n = 2 : 4

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
    fprintf ( 1, '  Sphere center = \n' );
    for i = 1 : n
      fprintf ( 1, '  %12f\n', xc(i) );
    end
    fprintf ( 1, '  Sphere radius = %f\n', r );
    fprintf ( 1, '  Sphere area = %f\n', sphere_area_nd ( n, r ) );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    Rule:     #5           #7.1\n' );
    fprintf ( 1, '    Function\n' );
    fprintf ( 1, '\n' );

    for i = 1 : num

      FUNC_ND_INDEX = i;

      result1 = sphere_05_nd ( 'function_nd', n, xc, r );
      result2 = sphere_07_1_nd ( 'function_nd', n, xc, r );

      fname = function_nd_name ( i );

      fprintf ( 1, '  %s  %12f  %12f\n', fname, result1, result2 );

    end

  end

  return
end
