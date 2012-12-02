function determ = pei_determinant ( alpha, n )

%*****************************************************************************80
%
%% PEI_DETERMINANT returns the determinant of the Pei matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines the Pei matrix.  A
%    typical value of ALPHA is 1.0.
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  determ = alpha^( n - 1 ) * ( alpha + n );

  return
end
