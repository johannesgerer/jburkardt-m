function s = cardinal_sin ( j, m, t )

%*****************************************************************************80
%
%% CARDINAL_SIN evaluates the J-th cardinal sine basis function.
%
%  Discussion:
%
%    The base points are T(I) = pi * I / ( M + 1 ), 0 <= I <= M + 1.
%    Basis function J is 1 at T(J), and 0 at T(I) for I /= J
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Boyd,
%    Exponentially convergent Fourier-Chebyshev quadrature schemes on
%    bounded and infinite intervals,
%    Journal of Scientific Computing,
%    Volume 2, Number 2, 1987, pages 99-109.
%
%  Parameters:
%
%    Input, integer J, the index of the basis function.
%    0 <= J <= M + 1.
%
%    Input, integer M, indicates the size of the basis set.
%
%    Input, real T(*), one or more points in [0,pi] where the
%    basis function is to be evaluated.
%
%    Output, real S, the value of the function at T.
%
  tj = pi * j / ( m + 1 );

  s = ( -1.0 ) ^ mod ( j + 1, 2 ) ...
    * sin ( tj ) ...
    * sin ( ( m + 1 ) * t ) ...
    / ( m + 1 ) ...
    ./ ( cos ( t ) - cos ( tj ) );

  i = find ( abs ( t - tj ) < eps );
  s(i) = 1.0;

  return
end
  
