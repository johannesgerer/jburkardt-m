function arpack_test02 ( )

%*****************************************************************************80
%
%% ARPACK_TEST02 tests EIGS for the smallest eigenvalues, using a function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ARPACK_TEST02:\n' );
  fprintf ( 1, '  EIGS can compute a few eigenvalues\n' );
  fprintf ( 1, '  of least or greatest magnitude.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  When the matrix A is too large to store explicitly,\n' );
  fprintf ( 1, '  the user may supply a routine which computes A*x,\n' );
  fprintf ( 1, '  or inverse(A)*x.\n' );
  
  opts.disp = 0;
  opts.issym = 1;

  n = 139;
%
%  In general, n = size ( A, 1 ) where A = delsq ( numgrid('C',15) );
%
  lambda_small = eigs ( @(x)ainv_x(x,'C',15), n, 5, 'SM', opts )
    
  return
end
