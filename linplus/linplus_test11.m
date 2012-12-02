function linplus_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests R83P_ML.
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
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  R83P_ML computes A*x or A''*X\n' );
  fprintf ( 1, '    where A has been factored by R83P_FA.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  for job = 0 : 1
%
%  Set the matrix.
%
    [ a, seed ] = r83p_random ( n, seed );
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r83p_mxv ( n, a, x );
    else
      b = r83p_vxm ( n, a, x );
    end
%
%  Factor the matrix.
%
    [ a_lu, work2, work3, work4, info ] = r83p_fa ( n, a );

    if ( info ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST11 - Fatal error!\n' );
      fprintf ( 1, '  R83P_FA declares the matrix is singular!\n' );
      fprintf ( 1, '  The value of INFO is %d\n', info );
      return;
    end
%
%  Now multiply factored matrix times solution to get right hand side again.
%
    b2 = r83p_ml ( n, a_lu, x, job );

    if ( job == 0 )
      r8vec2_print_some ( n, b, b2, 10, '  A*x and PLU*x' );
    else
      r8vec2_print_some ( n, b, b2, 10, '  A''*x and (PLU)''*x' );
    end

  end

  return
end
