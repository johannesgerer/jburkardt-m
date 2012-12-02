function exact = p17_exact ( )

%*****************************************************************************80
%
%% P17_EXACT returns the exact integral for problem 17.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  beta = 2.0;

  exact = sqrt ( pi ) * cos ( 0.5 * atan ( 2.0^beta ) ) ...
    / sqrt ( sqrt ( 1.0 + 0.25^beta) );

  return
end
