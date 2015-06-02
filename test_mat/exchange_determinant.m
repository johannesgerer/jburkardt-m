function determ = exchange_determinant ( n )

%*****************************************************************************80
%
%% EXCHANGE_DETERMINANT returns the determinant of the EXCHANGE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real DETERM, the determinant.
%
  if ( mod ( floor ( n / 2 ), 2 ) == 0 )
    determ = 1.0;
  else
    determ = -1.0;
  end

  return
end
