function determ = schur_block_determinant ( n, x, y )

%*****************************************************************************80
%
%% SCHUR_BLOCK_DETERMINANT returns the determinant of the SCHUR_BLOCK matrix.
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
%    Input, integer N, the order of A.
%
%    Input, real X( (N+1)/2 ), specifies the diagonal 
%    elements of A.
%
%    Input, real Y( N/2 ), specifies the off-diagonal 
%    elements of the Schur blocks.
%
%    Output, real DETERM, the determinant of A.
%
  determ = 1.0;

  for i = 1 : floor ( n / 2 )
    determ = determ * ( x(i)^2 + y(i)^2 );
  end

  if ( mod ( n, 2 ) == 1 )
    determ = determ * x(floor ( (n+1)/2 ) );
  end

  return
end
