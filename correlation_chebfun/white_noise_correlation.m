function K = white_noise_correlation ( s, t )

%*****************************************************************************80
%
%% WHITE_NOISE_CORRELATION evaluates the white_noise correlation function.
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
  K = zeros ( size ( s ) );

  i = find ( s == t );

  K(i) = 1.0;

  return
end

