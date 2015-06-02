function a = c8mat_test ( n )

%*****************************************************************************80
%
%% C8MAT_TEST sets up a test matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, complex A(N,N), the Fourier matrix.
%
  complex_i = complex ( 0.0, 1.0 );
  
  for i = 1 : n
    for j = 1 : n

      angle = 2.0 * pi * ( i - 1 ) * ( j - 1 ) / n;

      a(i,j) = exp ( complex_i * angle ) / sqrt ( n );

    end
  end

  return
end
