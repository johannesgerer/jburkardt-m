function determ = fourier_determinant ( n )

%*****************************************************************************80
%
%% FOURIER_DETERMINANT returns the determinant of the FOURIER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, complex DETERM, the determinant.
%
      if ( mod ( n, 8 ) == 0 | mod ( n, 8 ) == 7 )
    determ = complex (  0.0,  1.0 );
  elseif ( mod ( n, 8 ) == 1 | mod ( n, 8 ) == 6 )
    determ = complex (  1.0,  0.0 );
  elseif ( mod ( n, 8 ) == 2 | mod ( n, 8 ) == 5 )
    determ = complex ( -1.0,  0.0 );
  elseif ( mod ( n, 8 ) == 3 | mod ( n, 8 ) == 4 )
    determ = complex (  0.0, -1.0 );
  end

  return
end
