function K = gaussian_correlation ( s, t )

%*****************************************************************************80
%
%% GAUSSIAN_CORRELATION evaluates the Gaussian correlation function.
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
  K = exp ( - ( s - t ).^2 );

  return
end
