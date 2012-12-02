function linplus_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests R83P_FA, R83P_SL.
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
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  R83P_FA factors a tridiagonal periodic system.\n' );
  fprintf ( 1, '  R83P_SL solves a tridiagonal periodic system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r83p_random ( n, seed );
%
%  Factor the matrix.
%
  [ a_lu, work2, work3, work4, info ] = r83p_fa ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Fatal error!\n' );
    fprintf ( 1, '  R83P_FA returns INFO = %d\n', info );
    return
  end

  for job = 0 : 1
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    b = r83p_ml ( n, a_lu, x, job );
%
%  Solve the linear system.
%
    x = r83p_sl ( n, a_lu, b, job, work2, work3, work4 );

    if ( job == 0 )
      r8vec_print ( n, x, '  Solution:' );
    else
      r8vec_print ( n, x, '  Solution to transposed system:' );
    end

  end

  return
end
