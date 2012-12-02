function a = daub2_matrix ( n )

%*****************************************************************************80
%
%% DAUB2_MATRIX returns the DAUB2 matrix.
%
%  Discussion:
%
%    The DAUB2 matrix is the Daubechies wavelet transformation matrix
%    with 2 coefficients.
%
%    The DAUB2 matrix is also known as the Haar matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 2 and a multiple of 2.
%
%    Output, real A(N,N), the matrix.
%
  c = [ 7.071067811865475E-01; ...
        7.071067811865475E-01 ];

  if ( n < 2 || mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DAUB2_MATRIX - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 2 and a multiple of 2.\n' );
    error ( 'DAUB2_MATRIX - Fatal error!' );
  end

  a = zeros ( n, n );

  for i = 1 : 2 : n - 1

    a(i,i)     =   c(1);
    a(i,i+1)   =   c(2);

    a(i+1,i)   =   c(2);
    a(i+1,i+1) = - c(1);

  end

  return
end
