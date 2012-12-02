function linplus_test18 ( )

%*****************************************************************************80
%
%% TEST18 tests R8CB_ML.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  ml = 1;
  mu = 2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST18\n' );
  fprintf ( 1, '  For a compact band matrix:\n' );
  fprintf ( 1, '  R8CB_ML computes A*x or A''*X\n' );
  fprintf ( 1, '    where A has been factored by R8CB_FA.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N     = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );

  for job = 0 : 1
%
%  Set the matrix.
%
    [ a, seed ] = r8cb_random ( n, ml, mu, seed );
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8cb_mxv ( n, ml, mu, a, x );
    else
      b = r8cb_vxm ( n, ml, mu, a, x );
    end
%
%  Factor the matrix.
%
    [ a_lu, info ] = r8cb_np_fa ( n, ml, mu, a );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST18 - Fatal error!\n' );
      fprintf ( 1, '  R8CB_FA declares the matrix is singular!\n' );
      fprintf ( 1, '  The value of INFO is %d\n', info );
      return
    end
%
%  Now multiply factored matrix times solution to get right hand side again.
%
    b2 = r8cb_ml ( n, ml, mu, a_lu, x, job );

    if ( job == 0 )
      r8vec2_print_some ( n, b, b2, 10, '  A*x and PLU*x' );
    else
      r8vec2_print_some ( n, b, b2, 10, '  A''*x and (PLU)''*x' );
    end

  end

  return
end
