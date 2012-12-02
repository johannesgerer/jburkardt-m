function geometry_test1836 ( )

%*****************************************************************************80
%
%% GEOMETRY_TEST1836 tests SPHERE_EXP2IMP_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2011
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  p = [ ...
    4.0, 2.0, 3.0;
    1.0, 5.0, 3.0;
    1.0, 2.0, 6.0;
   -2.0, 2.0, 3.0 ]';
  pc_true = [ 1.0, 2.0, 3.0 ]';
  r_true = 3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEOMETRY_TEST1836\n' );
  fprintf ( 1, '  SPHERE_EXP2IMP_ND: explicit sphere => implicit form;\n' );

  r8mat_transpose_print ( n, n + 1, p, '  Initial form of explicit sphere:' );

  [ r, pc ] = sphere_exp2imp_nd ( n, p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed form of implicit sphere:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Imputed radius = %f\n', r );
  fprintf ( 1, '  True radius =    %f\n', r_true );

  r8vec_print ( n, pc, '  Imputed center' );

  r8vec_print ( n, pc_true, '  True center' );

  return
end
