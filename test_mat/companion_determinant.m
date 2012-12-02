function determ = companion_determinant ( n, x )

%*****************************************************************************80
%
%% COMPANION_DETERMINANT returns the determinant of the COMPANION matrix.
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
%    Input, integer N, the order of A.
%
%    Input, real X(N), the coefficients of the polynomial 
%    which define A.
%
%    Output, real DETERM, the determinant.
%
  if ( mod ( n, 2 ) == 1 )
    determ = + x(1);
  else
    determ = - x(1);
  end

  return
end
