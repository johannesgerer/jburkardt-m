function exact = p01_exact ( )

%*****************************************************************************80
%
%% P01_EXACT returns the exact integral for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  omega = 1.0;

  exact = sqrt ( pi ) * exp ( - omega * omega );

  return
end
