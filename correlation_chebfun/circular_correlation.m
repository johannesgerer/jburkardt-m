function K = circular_correlation ( s, t )

%*****************************************************************************80
%
%% CIRCULAR_CORRELATION evaluates the circular correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Petter Abrahamsen,
%    A Review of Gaussian Random Fields and Correlation Functions,
%    Norwegian Computing Center, 1997.
%
  K = zeros ( size ( s ) );

  i = find ( abs ( s - t ) <= 1.0 );

  K(i) = ( 1.0 - ( 2.0 / pi ) ...
    * ( abs ( s(i) - t(i) ) .* sqrt ( 1.0 - ( s(i) - t(i) ).^2 ) ...
    + asin ( abs ( s(i) - t(i) ) ) ) );

  return
end


  
