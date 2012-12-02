function determ = clement1_determinant ( n )

%*****************************************************************************80
%
%% CLEMENT1_DETERMINANT returns the determinant of the Clement1 matrix.
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
%    Output, real DETERM, the determinant.
%
  if ( mod ( n, 2 ) == 1 )

    determ = 0.0;

  else

    determ = 1.0;
    for i = 1: 2 : n-1
      determ = determ * i * i;
    end

    if ( mod ( n/2, 2 ) == 1 )
      determ = - determ;
    end

  end

  return
end
