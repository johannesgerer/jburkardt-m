function determ = fiedler_determinant ( n, x )

%*****************************************************************************80
%
%% FIEDLER_DETERMINANT returns the determinant of the FIEDLER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the values that define A.
%
%    Output, real DETERM, the determinant.
%
  determ = 2.0 ^ ( n - 2 );

  if ( mod ( n, 2 ) == 1 )
    determ = - determ;
  end

  for i = 1 : n - 1
    for j = i + 1 : n
      if ( x(j) < x(i) )
        t    = x(j);
        x(j) = x(i);
        x(i) = t;
        determ = - determ;
      end
    end
  end

  determ = determ * ( x(n) - x(1) );

  for i = 2 : n
    determ = determ * ( x(i) - x(i-1) );
  end

  return
end
