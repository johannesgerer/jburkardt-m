function a = daub4 ( n )

%*****************************************************************************80
%
%% DAUB4 returns the DAUB4 matrix.
%
%  Discussion:
%
%    The DAUB4 matrix is the Daubechies wavelet transformation matrix
%    with 4 coefficients.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 4, and a multiple of 2.
%
%    Output, real A(N,N), the matrix.
%
  if ( n < 4 || mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DAUB4 - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 4 and a multiple of 2.\n' );
    error ( 'DAUB4 - Fatal error!' );
  end

  a = zeros ( n, n );

  c0 = ( 1.0 + sqrt ( 3.0 ) ) / sqrt ( 32.0 );
  c1 = ( 3.0 + sqrt ( 3.0 ) ) / sqrt ( 32.0 );
  c2 = ( 3.0 - sqrt ( 3.0 ) ) / sqrt ( 32.0 );
  c3 = ( 1.0 - sqrt ( 3.0 ) ) / sqrt ( 32.0 );

  for i = 1 : 2 : n - 1

    a(i,i)                  =   c0;
    a(i,i+1)                =   c1;
    a(i,i4_wrap(i+2,1,n))   =   c2;
    a(i,i4_wrap(i+3,1,n))   =   c3;

    a(i+1,i)                =   c3;
    a(i+1,i+1)              = - c2;
    a(i+1,i4_wrap(i+2,1,n)) =   c1;
    a(i+1,i4_wrap(i+3,1,n)) = - c0;

  end

  return
end
