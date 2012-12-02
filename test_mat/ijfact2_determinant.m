function determ = ijfact2_determinant ( n )

%*****************************************************************************80
%
%% IJFACT2_DETERMINANT returns the determinant of the IJFACT2 matrix.
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
  determ = 1.0;

  for i = 0 : n - 1
    determ = determ * r8_factorial ( i ) / r8_factorial ( n + 1 + i );
  end

  if ( mod ( ( n * ( n - 1 ) ) / 2, 2 ) ~= 0 )
    determ = - determ;
  end

  return
end
