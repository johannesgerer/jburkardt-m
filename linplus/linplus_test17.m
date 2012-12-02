function linplus_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests R8CB_NP_FA, R8CB_NP_SL.
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
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  For a compact band matrix, no pivoting:\n' );
  fprintf ( 1, '  R8CB_NP_FA factors;\n' );
  fprintf ( 1, '  R8CB_NP_SL solves.\n' );
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
%  Compute the right hand side.
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
      fprintf ( 1, '  Fatal error!\n' );
      fprintf ( 1, '  R8CB_NP_FA claims the matrix is singular.\n' );
      fprintf ( 1, '  The value of info is %d\n', info );
      return
    end
%
%  Solve the system.
%
    x = r8cb_np_sl ( n, ml, mu, a_lu, b, job );

    if ( job == 0 )
      r8vec_print ( n, x, '  Solution:' );
    else
      r8vec_print ( n, x, '  Solution to transposed system:' );
    end

  end

  return
end
