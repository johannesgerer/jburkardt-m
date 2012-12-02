function determ = fourier_sine_determinant ( n )

%*****************************************************************************80
%
%% FOURIER_SINE_DETERMINANT returns the determinant of the FOURIER_SINE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2007
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
    determ = + 1.0;
  else
    determ = - 1.0;
  end

  return
end
