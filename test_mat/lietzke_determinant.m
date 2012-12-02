function determ = lietzke_determinant ( n )

%*****************************************************************************80
%
%% LIETZKE_DETERMINANT returns the determinant of the LIETZKE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns 
%    of the matrix.
%
%    Output, real DETERM, the determinant..
%
  determ = ( n + 1 ) * 2^( n - 2 );

  return
end
