function y = fprunge ( x )

%*****************************************************************************80
%
%% FPRUNGE evaluates the derivative of the Runge function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real FPRUNGE, the value of the derivative of the Runge function.
%
  y = -50.0E+00 * x ./ ( 1.0E+00 + 25.0E+00 * x.^2 ) .^2;

  return
end
