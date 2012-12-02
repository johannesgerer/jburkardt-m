function linplus_test63 ( )

%*****************************************************************************80
%
%% TEST63 tests R8VM_SL.
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
  n = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST63\n' );
  fprintf ( 1, '  R8VM_SL solves a Vandermonde system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8vm_random ( n, n, seed );

  for job = 0 : 1
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r8vm_mxv ( n, n, a, x );
    else
      b = r8vm_vxm ( n, n, a, x );
    end
%
%  Solve the linear system.
%
    [ x, info ] = r8vm_sl ( n, a, b, job );

    if ( job == 0 )
      r8vec_print_some ( n, x, 1, 10, '  Solution:' );
    else
      r8vec_print_some ( n, x, 1, 10, '  Solution to transposed system:' );
    end

  end
 
  return
end
