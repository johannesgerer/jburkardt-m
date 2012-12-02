function a = daub4_matrix ( n )

%*****************************************************************************80
%
%% DAUB4_MATRIX returns the DAUB4 matrix.
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
%    30 July 2011
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
  c = [  0.4829629131445341E+00; ...
         0.8365163037378079E+00; ...
         0.2241438680420133E+00; ...
        -0.1294095225512603E+00 ];

  if ( n < 4 || mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DAUB4_MATRIX - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 4 and a multiple of 2.\n' );
    error ( 'DAUB4_MATRIX - Fatal error!' );
  end

  a = zeros ( n, n );

  for i = 1 : 2 : n - 1

    a(i,i)                  =   c(1);
    a(i,i+1)                =   c(2);
    a(i,i4_wrap(i+2,1,n))   =   c(3);
    a(i,i4_wrap(i+3,1,n))   =   c(4);

    a(i+1,i)                =   c(4);
    a(i+1,i+1)              = - c(3);
    a(i+1,i4_wrap(i+2,1,n)) =   c(2);
    a(i+1,i4_wrap(i+3,1,n)) = - c(1);

  end

  return
end
