function determ = dif1_determinant ( n )

%*****************************************************************************80
%
%% DIF1_DETERMINANT returns the determinant of the DIF1 matrix.
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
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  if ( mod ( n, 2 ) == 0 )
    determ = 1.0;
  else
    determ = 0.0;
  end

  return
end
