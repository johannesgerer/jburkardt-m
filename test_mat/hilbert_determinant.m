function determ = hilbert_determinant ( n )

%*****************************************************************************80
%
%% HILBERT_DETERMINANT returns the determinant of the Hilbert matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2007
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
  top = 1.0;
  for i = 1 : n
    for j = i + 1 : n
      top = top * ( j - i ) * ( j - i );
    end
  end

  bottom = 1.0;
  for i = 1 : n
    for j = 1 : n
      bottom = bottom * ( i + j - 1 );
    end
  end

  determ = top / bottom;

  return
end
