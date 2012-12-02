function f = f12_f0 ( n, x, y )

%*****************************************************************************80
%
%% F12_F0 returns the value of function 12.
%
%  Discussion:
%
%    This is an example from Vicente Romero.
%
%      R = sqrt ( X^2 + Y^2 )
%      T = atan ( Y / X )
%      F(X,Y) = ( 0.8 * R + 0.35 * sin ( 2.4 * pi * R / sqrt ( 2 )  ) )
%               * 1.5 * sin ( 1.3 * T )
%
%    The mean and standard deviation of the function over the interval
%    are approximately:
%
%      mu    = 0.581608
%      sigma = 0.343208
%
%    Since the interpolation interval is the unit square, this means the
%    integral of the function over the interval can also be estimated as
%
%      I = 0.581608
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Vicente Romero, John Burkardt, Max Gunzburger, Janet Peterson,
%    Initial Evaluation of Centroidal Voronoi Tessellation for
%    Statistical Sampling and Function Integration,
%    Fourth International Symposium on Uncertainty Modeling and Analysis,
%    (ISUMA) 2003.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), Y(N,1), the evalution points.
%
%    Output, real F(N,1), the function values.
%
  r(1:n,1) = sqrt ( x(1:n,1).^2 + y(1:n,1).^2 );
  t(1:n,1) = atan2 ( y(1:n,1), x(1:n,1) );

  f(1:n,1) = 1.5 * ( 0.8 * r(1:n,1) ...
    + 0.35 * sin ( 2.4 * pi * r(1:n,1) / sqrt ( 2.0 ) ) ) ...
    .* sin ( 1.3 * t(1:n,1) );

  return
end
