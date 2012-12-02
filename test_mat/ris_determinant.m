function determ = ris_determinant ( n )

%*****************************************************************************80
%
%% RIS_DETERMINANT returns the determinant of the Ris matrix.
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
%    Output, real DETERM the determinant.
%
  top = 1.0;
  for i = 1 : n
    for j = i + 1 : n
      top = top * ( 4 * ( i - j ) * ( i - j ) );
    end
  end

  bottom = 1.0;
  for i = 1 : n
    for j = 1 : n
      bottom = bottom * ( 3 + 2 * n - 2 * i - 2 * j );
    end
  end

  determ = top / bottom;

  return
end
