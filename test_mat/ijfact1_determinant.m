function determ = ijfact1_determinant ( n )

%*****************************************************************************80
%
%% IJFACT1_DETERMINANT returns the determinant of the IJFACT1 matrix.
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

  for i = 1 : n - 1
    determ = determ * r8_factorial ( i + 1 ) * r8_factorial ( n - i );
  end

  determ = determ * r8_factorial ( n + 1 );

  return
end
