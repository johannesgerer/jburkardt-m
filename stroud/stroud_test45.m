function stroud_test45 ( )

%*****************************************************************************80
%
%% TEST45 tests TORUS_1.
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
  n = 10;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST45\n' );
  fprintf ( 1, '  TORUS_1 approximates integrals on a torus.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The degree N will be varied.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Inner radius = %f\n', r1 );
  fprintf ( 1, '  Outer radius = %f\n', r2 );
  fprintf ( 1, '  Area = %f\n', torus_area_3d ( r1, r2 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    F(X)  ' );
  for j = 0 : 2 : 8
    fprintf ( 1, '  %6d      ', 2^j );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
 
  num = function_3d_num ( );

  for i = 1 : num

    FUNC_3D_INDEX = i;

    for j = 1 : 5

      j2 = 2 * ( j - 1 );
      n = 2^j2;
      result(j) = torus_1 ( 'function_3d', r1, r2, n );

    end

    fname = function_3d_name ( i );
    fprintf ( 1, '  %s', fname );
    for j = 1 : 5
      fprintf ( 1, '  %12f', result(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
