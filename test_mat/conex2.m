function a = conex2 ( alpha )

%*****************************************************************************80
%
%% CONEX2 returns the CONEX2 matrix.
%
%  Formula:
%
%    1   1-1/ALPHA^2 -2
%    0   1/ALPHA      -1/ALPHA
%    0   0             1
%
%  Example:
%
%    ALPHA = 100
%
%    1  0.9999  -2
%    0  0.01    -0.01
%    0  0        1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is upper triangular.
%
%    det ( A ) = 1 / ALPHA.
%
%    LAMBDA = ( 1, 1/ALPHA, 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Cline, RK Rew,
%    A set of counterexamples to three condition number estimators,
%    SIAM Journal on Scientific and Statistical Computing,
%    Volume 4, 1983, pages 602-611.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar defining A.  
%    A common value is 100.0.  ALPHA must not be zero.
%
%    Output, real A(3,3), the atrix.
%
  if ( alpha == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CONEX2 - Fatal error!\n' );
    fprintf ( 1, '  The input value of ALPHA was zero.\n' );
    error ( 'CONEX2 - Fatal error!' );
  end

  a(1,1) = 1.0;
  a(1,2) = ( alpha * alpha - 1.0 ) / ( alpha * alpha );
  a(1,3) = -2.0;

  a(2,1) = 0.0;
  a(2,2) = 1.0 / alpha;
  a(2,3) = -1.0 / alpha;

  a(3,1) = 0.0;
  a(3,2) = 0.0;
  a(3,3) = 1.0;

  return
end
