function linplus_test56 ( )

%*****************************************************************************80
%
%% TEST56 tests R8SM_ML.
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
  m = 7;
  n = m;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST56' );
  fprintf ( 1, '  R8SM_ML computes A*x or A''*X\n' );
  fprintf ( 1, '    where A is a Sherman Morrison matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );

  for job = 0 : 1
%
%  Set the matrix.
%
    [ a, u, v, seed ] = r8sm_random ( m, n, seed );

    r8sm_print ( m, n, a, u, v, '  The Sherman Morrison matrix:' );
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8sm_mxv ( m, n, a, u, v, x );
    else
      b = r8sm_vxm ( m, n, a, u, v, x );
    end
%
%  Factor the matrix.
%
    [ a_lu, pivot, info ] = r8ge_fa ( n, a );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Fatal error!\n' );
      fprintf ( 1, '  R8GE_FA declares the matrix is singular!\n' );
      fprintf ( 1, '  The value of INFO is %d\n', info );
      return
    end
%
%  Now multiply factored matrix times solution to get right hand side again.
%
    b2 = r8sm_ml ( n, a_lu, u, v, pivot, x, job );

    if ( job == 0 )
      r8vec2_print_some ( n, b, b2, 10, '  A*x and PLU*x' );
    else
      r8vec2_print_some ( n, b, b2, 10, '  A''*x and (PLU)''*x' );
    end

  end

  return
end
