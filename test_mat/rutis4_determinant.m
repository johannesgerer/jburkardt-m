function determ = rutis4_determinant ( n )

%*****************************************************************************80
%
%% RUTIS4_DETERMINANT returns the eigenvalues of the RUTIS4 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
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
  determ = 1.0;

  for i = 1 : n
    angle = ( i ) * pi / ( 2 * ( n + 1 ) );
    determ = determ * 64.0 * ( cos ( angle ) )^6;
  end

  return
end
