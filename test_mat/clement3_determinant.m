function determ = clement3_determinant ( n, x, y )

%*****************************************************************************80
%
%% CLEMENT3_DETERMINANT returns the determinant of the Clement3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N-1), Y(N-1), the first super and
%    subdiagonals of the matrix A.
%
%    Output, real DETERM, the determinant of A.
%
  if ( mod ( n, 2 ) == 1 )

    determ = 0.0;

  else

    determ = 1.0;
    for i = 1 : 2 : n-1
      determ = determ * x(i) * y(i);
    end

    if ( mod ( n/2, 2 ) == 1 )
      determ = - determ;
    end

  end

  return
end
