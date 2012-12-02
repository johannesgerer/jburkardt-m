function determ = jacobi_determinant ( n )

%*****************************************************************************80
%
%% JACOBI_DETERMINANT returns the determinant of the Jacobi matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  if ( mod ( n, 2 ) == 1 )
  
    determ = 0.0;
    
  else
  
    lambda = legendre_zeros ( n );
  
    determ = prod ( lambda(1:n) );

  end

  return
end
