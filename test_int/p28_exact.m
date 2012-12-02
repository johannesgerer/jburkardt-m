function exact = p28_exact ( )

%*****************************************************************************80
%
%% P28_EXACT returns the exact integral for problem 28.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = ( 50.0 / 2501.0 ) * ( 1.0 - exp ( - 2.0 * pi ) );

  return
end
