function linplus_test20 ( )

%*****************************************************************************80
%
%% TEST20 tests R8CI_SL.
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
  fprintf ( 1, 'TEST20\n' );
  fprintf ( 1, '  R8CI_SL solves a circulant system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8ci_random ( n, seed );

  r8ci_print ( n, a, '  The circulant matrix:' );

  for job = 0 : 1
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8ci_mxv ( n, a, x );
    else
      b = r8ci_vxm ( n, a, x );
    end
%
%  Solve the linear system.
%
    x = r8ci_sl ( n, a, b, job );

    if ( job == 0 )
      r8vec_print ( n, x, '  Solution:' );
    else
      r8vec_print ( n, x, '  Solution to transposed system:' );
    end

  end

  return
end
