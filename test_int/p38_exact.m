function exact = p38_exact ( )

%*****************************************************************************80
%
%% P38_EXACT returns the exact integral for problem 38.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  alpha = p38_param_get ();

  x = 2.0^alpha;

  exact = pi * besselj ( 0, x );

  return
end
