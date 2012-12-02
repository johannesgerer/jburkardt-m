function K = rational_quadratic_correlation ( s, t )

%*****************************************************************************80
%
%% RATIONAL_QUADRATIC_CORRELATION evaluates the rational_quadratic correlation function.
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
  K = 1.0 ./ ( 1.0 + ( s - t ).^2 );

  return
end


  
