function K = cubic_correlation ( s, t )

%*****************************************************************************80
%
%% CUBIC_CORRELATION evaluates the cubic correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2012
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

  i = find ( abs ( s - t ) < 1.0 );

  K(i) = 1.0 - 7.0 * abs ( s(i) - t(i) ).^2 + 8.75 * abs ( s(i) - t(i) ).^3 ...
    - 3.5 * abs ( s(i) - t(i) ).^5 + 0.75 * abs ( s(i) - t(i) ).^7;

  return
end


  
