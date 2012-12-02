function a = conex1 ( alpha )

%*****************************************************************************80
%
%% CONEX1 returns a 4 by 4 LINPACK counterexample matrix.
%
%  Discussion:
%
%    The CONEX1 matrix is a counterexample to the LINPACK condition
%    number estimator RCOND available in the LINPACK routine DGECO.
%
%  Formula:
%
%    1  -1 -2*ALPHA   0
%    0   1    ALPHA    -ALPHA
%    0   1  1+ALPHA  -1-ALPHA
%    0   0  0           ALPHA
%
%  Example:
%
%    ALPHA = 100
%
%    1  -1  -200     0
%    0   1   100  -100
%    0   1   101  -101
%    0   0     0   100
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
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
%    A common value is 100.0.
%
%    Output, real A(4,4), the matrix.
%
  a(1,1) = 1.0;
  a(1,2) = -1.0;
  a(1,3) = -2.0 * alpha;
  a(1,4) = 0.0;

  a(2,1) = 0.0;
  a(2,2) = 1.0;
  a(2,3) = alpha;
  a(2,4) = -alpha;

  a(3,1) = 0.0;
  a(3,2) = 1.0;
  a(3,3) = 1.0 + alpha;
  a(3,4) = -1.0 - alpha;

  a(4,1) = 0.0;
  a(4,2) = 0.0;
  a(4,3) = 0.0;
  a(4,4) = alpha;

  return
end
