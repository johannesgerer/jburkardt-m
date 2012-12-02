function linplus_test37 ( )

%*****************************************************************************80
%
%% TEST37 tests R8GE_NP_ML.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST37\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_NP_ML computes A*x or A''*X\n' );
  fprintf ( 1, '    where A has been factored by R8GE_NP_FA.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  for job = 0 : 1
%
%  Set the matrix.
%
    [ a, seed ] = r8ge_random ( n, n, seed );
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8ge_mxv ( n, n, a, x );
    else
      b = r8ge_vxm ( n, n, a, x );
    end
%
%  Factor the matrix.
%
    [ a_lu, info ] = r8ge_np_fa ( n, a );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST37 - Fatal error!\n' );
      fprintf ( 1, '  R8GE_NP_FA declares the matrix is singular!\n' );
      fprintf ( 1, '  The value of INFO is %d\n', info );
      continue;
    end
%
%  Now multiply factored matrix times solution to get right hand side again.
%
    b2 = r8ge_np_ml ( n, a_lu, x, job );

    if ( job == 0 )
      r8vec2_print_some ( n, b, b2, 10, '  A*x and PLU*x' );
    else
      r8vec2_print_some ( n, b, b2, 10, '  A''*x and (PLU)''*x' );
    end

  end

  return
end
