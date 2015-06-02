function f = fx5 ( n, x )

%*****************************************************************************80
%
%% FX5 is the fifth 1D example.
%
%  Discussion:
%
%    The function should be plotted over [-1.0,+1.0].
%
%    The function actually has no discontinuities, but does have a
%    steep rise.  The local parameter S controls the steepness of the rise.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Rick Archibald, Anne Gelb, Jungho Yoon,
%    Polynomial fitting for edge detection in irregularly sampled signals 
%    and images,
%    SIAM Journal on Numerical Analysis,
%    Volume 43, Number 1, 2006, pages 259-279.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the arguments.
%
%    Output, real F(N,1), the function values.
%

%
%  Destroy all row vectors!
%
  x = x ( : );

  s = 20.0;

  f = tanh ( s * x );

  return
end

