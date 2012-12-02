function determ = parter_determinant ( n )

%*****************************************************************************80
%
%% PARTER_DETERMINANT returns the determinant of the Parter matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
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
      top = top * ( j - i ) * ( i - j );
    end
  end

  bottom = 1.0;
  for i = 1 : n
    for j = 1 : n
      bottom = bottom * ( ( i - j ) + 0.5 );
    end
  end

  determ = top / bottom;

  return
end
