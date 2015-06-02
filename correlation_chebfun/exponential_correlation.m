function K = exponential_correlation ( s, t )

%*****************************************************************************80
%
%% EXPONENTIAL_CORRELATION evaluates the exponential correlation function.
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
  K = exp ( - abs ( s - t ) );

  return
end
