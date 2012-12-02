function arpack_test01 ( )

%*****************************************************************************80
%
%% ARPACK_TEST01 tests EIGS for smallest and largest eigenvalues, using A explicitly.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ARPACK_TEST01:\n' );
  fprintf ( 1, '  EIGS can compute a few eigenvalues\n' );
  fprintf ( 1, '  of least or greatest magnitude.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the simplest case, the matrix A\n' );
  fprintf ( 1, '  is available explicitly.\n' );
  
  opts.disp = 0;
  
  A = delsq ( numgrid ( 'C', 15 ) );
 
  lambda_small = eigs ( A, 5, 'SM', opts )
  
  lambda_big = eigs ( A, 5, 'LM', opts )
  
  return
end
