function a = daub6 ( n )

%*****************************************************************************80
%
%% DAUB6 returns the DAUB6 matrix.
%
%  Discussion:
%
%    The DAUB6 matrix is the Daubechies wavelet transformation matrix
%    with 6 coefficients.
%
%  Properties:
%
%    The family of matrices is nested as a function of N.
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
%    N must be at least 6, and a multiple of 2.
%
%    Output, real A(N,N), the matrix.
%
  if ( n < 6 || mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DAUB6 - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 6 and a multiple of 2.\n' );
    error ( 'DAUB6 - Fatal error!' );
  end

  a = zeros ( n, n );

  c0 =  1.0 + sqrt ( 10.0 ) +       sqrt ( 5.0 + sqrt ( 40.0 ) );
  c1 =  5.0 + sqrt ( 10.0 ) + 3.0 * sqrt ( 5.0 + sqrt ( 40.0 ) );
  c2 = 10.0 - sqrt ( 40.0 ) + 2.0 * sqrt ( 5.0 + sqrt ( 40.0 ) );
  c3 = 10.0 - sqrt ( 40.0 ) - 2.0 * sqrt ( 5.0 + sqrt ( 40.0 ) );
  c4 =  5.0 + sqrt ( 10.0 ) - 3.0 * sqrt ( 5.0 + sqrt ( 40.0 ) );
  c5 =  1.0 + sqrt ( 10.0 ) -       sqrt ( 5.0 + sqrt ( 40.0 ) );

  c0 = c0 / sqrt ( 512.0 );
  c1 = c1 / sqrt ( 512.0 );
  c2 = c2 / sqrt ( 512.0 );
  c3 = c3 / sqrt ( 512.0 );
  c4 = c4 / sqrt ( 512.0 );
  c5 = c5 / sqrt ( 512.0 );

  for i = 1 : 2 : n - 1

    a(i,i)                  =   c0;
    a(i,i+1)                =   c1;
    a(i,i4_wrap(i+2,1,n))   =   c2;
    a(i,i4_wrap(i+3,1,n))   =   c3;
    a(i,i4_wrap(i+4,1,n))   =   c4;
    a(i,i4_wrap(i+5,1,n))   =   c5;

    a(i+1,i)                =   c5;
    a(i+1,i+1)              = - c4;
    a(i+1,i4_wrap(i+2,1,n)) =   c3;
    a(i+1,i4_wrap(i+3,1,n)) = - c2;
    a(i+1,i4_wrap(i+4,1,n)) =   c1;
    a(i+1,i4_wrap(i+5,1,n)) = - c0;

  end

  return
end
