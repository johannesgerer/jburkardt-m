function K = besselk_correlation ( s, t )

%*****************************************************************************80
%
%% BESSELK_CORRELATION evaluates the Bessel K correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real S(*), T(*), pairs of argument values.
%
%    Output, real K(*), the correlation function values
%
  K = ones ( size ( s ) );

  i = find ( s ~= t );
  K(i) = abs ( s(i) - t(i) ) .* besselk ( 1, abs ( s(i) - t(i) ) );

  return
end
