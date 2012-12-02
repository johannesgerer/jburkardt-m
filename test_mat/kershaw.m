function a = kershaw ( )

%*****************************************************************************80
%
%% KERSHAW returns the Kershaw matrix.
%
%  Discussion:
%
%    The Kershaw matrix is a simple example of a symmetric
%    positive definite matrix for which the incomplete Cholesky
%    factorization fails, because of a negative pivot.
%
%  Example:
%
%     3 -2  0  2
%    -2  3 -2  0
%     0 -2  3 -2
%     2  0 -2  3
%
%  Properties:
%
%    A is symmetric.
%
%    A is positive definite.
%
%    det ( A ) = 1.
%
%    LAMBDA(A) = [ 
%      5.828427124746192
%      5.828427124746188
%      0.171572875253810
%      0.171572875253810 ].
%
%    A does not have an incompete Cholesky factorization.
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
%    Output, real A(4,4), the matrix.
%
  a = [ ...
     3.0, -2.0,  0.0,  2.0; ...
    -2.0,  3.0, -2.0,  0.0; ...
     0.0, -2.0,  3.0, -2.0; ...
     2.0,  0.0, -2.0,  3.0 ];

  return
end
