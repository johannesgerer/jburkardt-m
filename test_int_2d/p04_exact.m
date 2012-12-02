function exact = p04_exact ( )

%*****************************************************************************80
%
%% P04_EXACT returns the exact integral for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = ( sqrt ( 32.0 ) / 3.0 ) * ( sqrt ( 27.0 ) - sqrt ( 8.0 ) - 1.0 );

  return
end
