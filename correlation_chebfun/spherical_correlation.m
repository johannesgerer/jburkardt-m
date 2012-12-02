function K = spherical_correlation ( s, t )

%*****************************************************************************80
%
%% SPHERICAL_CORRELATION evaluates the spherical correlation function.
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

  K(i) = 1.0 - 1.5 * abs ( s(i) - t(i) ).^2 + 0.5 * abs ( s(i) - t(i) ).^3;

  return
end


  
