function lambda = kershaw_eigenvalues ( )

%*****************************************************************************80
%
%% KERSHAW_EIGENVALUES returns the eigenvalues of the KERSHAW matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Kershaw,
%    The Incomplete Cholesky-Conjugate Gradient Method for the Iterative
%    Solution of Systems of Linear Equations,
%    Journal of Computational Physics,
%    Volume 26, Number 1, January 1978, pages 43-65.
%
%  Parameters:
%
%    Output, real LAMBDA(4,1), the eigenvalues of the matrix.
%
  lambda(1:4,1) = [ ...
    5.828427124746192, ...
    5.828427124746188, ...
    0.171572875253810, ...
    0.171572875253810 ];

  return
end
