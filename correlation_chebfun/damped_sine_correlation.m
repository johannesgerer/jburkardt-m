function K = damped_sine_correlation ( s, t )

%*****************************************************************************80
%
%% DAMPED_SINE_CORRELATION evaluates the damped_sine correlation function.
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
%  Parameters:
%
%    Input, real S(*), T(*), pairs of argument values.
%
%    Output, real K(*), the correlation function values
%
  K = ones ( size ( s ) );

  i = find ( s ~= t );
  K(i) = sin ( abs ( s(i) - t(i) ) ) ./ abs ( s(i) - t(i) );

  return
end

