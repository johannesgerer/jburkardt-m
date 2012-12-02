function a = daub2 ( n )

%*****************************************************************************80
%
%% DAUB2 returns the DAUB2 matrix.
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
%    04 July 2011
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
  if ( n < 2 || mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DAUB2 - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 2 and a multiple of 2.\n' );
    error ( 'DAUB2 - Fatal error!' );
  end

  a = zeros ( n, n );

  c0 = sqrt ( 2.0 ) / 2.0;
  c1 = sqrt ( 2.0 ) / 2.0;

  for i = 1 : 2 : n - 1

    a(i,i)     =   c0;
    a(i,i+1)   =   c1;

    a(i+1,i)   =   c1;
    a(i+1,i+1) = - c0;

  end

  return
end
