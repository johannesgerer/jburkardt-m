function y = fpprunge ( x )

%*****************************************************************************80
%
%% FPPRUNGE evaluates the second derivative of the Runge function.
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
%    Output, real FPPRUNGE, the value of the second derivative of
%    the Runge function.
%
  y = ( -50.0E+00 + 3750.0E+00 * x.^2 ) ./ ( 1.0E+00 + 25.0E+00 * x.^2 ) .^3 ;

  return
end
