function linplus_test59 ( )

%*****************************************************************************80
%
%% TEST59 tests R8TO_SL.
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
  fprintf ( 1, 'TEST59\n' );
  fprintf ( 1, '  R8TO_SL solves a Toeplitz system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  [ a, seed ] = r8to_random ( n, seed );

  r8to_print ( n, a, '  The Toeplitz matrix:' );

  for job = 0 : 1
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8to_mxv ( n, a, x );
    else
      b = r8to_vxm ( n, a, x );
    end
%
%  Solve the linear system.
%
    x = r8to_sl ( n, a, b, job );

    if ( job == 0 )
      r8vec_print_some ( n, x, 1, 10, '  Solution:' );
    else
      r8vec_print_some ( n, x, 1, 10, '  Solution to transposed system:' );
    end

  end
 
  return
end
