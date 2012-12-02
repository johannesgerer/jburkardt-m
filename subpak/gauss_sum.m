function value = gauss_sum ( ndim, n, amplitude, center, width, x )

%*****************************************************************************80
%
%% GAUSS_SUM evaluates a function that is the sum of Gaussians.
%
%  Discussion:
%
%    Gauss_Sum(X) = Sum ( 1 <= J <= Ngauss ) Amplitude(I) * exp ( -Arg )
%
%    where
%
%      Arg = sum ( 1 <= I <= NDIM ) ( ( ( X(I) - Center(I,J) ) / Width(J) )**2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NDIM, the spatial dimension.
%
%    Input, integer N, the number of component Gaussian functions.
%
%    Input, real AMPLITUDE(N), CENTER(NDIM,N), WIDTH(N),
%    the amplitude, center and width for the component Gaussian functions.
%
%    Input, real X(NDIM), the point at which the function
%    is to be evaluated.
%
%    Output, real VALUE, the value of the function.
%
  value = 0.0;

  for j = 1 : n

    arg = sum ( ( ( x(1:ndim)' - center(1:ndim,j) ) / width(j) ).^2 );

    value = value + amplitude(j) * exp ( -arg );

  end

  return
end
