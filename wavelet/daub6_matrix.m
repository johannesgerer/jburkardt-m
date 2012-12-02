function a = daub6_matrix ( n )

%*****************************************************************************80
%
%% DAUB6_MATRIX returns the DAUB6 matrix.
%
%  Discussion:
%
%    The DAUB6 matrix is the Daubechies wavelet transformation matrix
%    with 6 coefficients.
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
%    N must be at least 6, and a multiple of 2.
%
%    Output, real A(N,N), the matrix.
%
  c = [  0.3326705529500826E+00; ...
         0.8068915093110925E+00; ...
         0.4598775021184915E+00; ...
       - 0.1350110200102545E+00; ...
       - 0.08544127388202666E+00; ...
         0.03522629188570953E+00 ];

  if ( n < 6 || mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DAUB6_MATRIX - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 6 and a multiple of 2.\n' );
    error ( 'DAUB6_MATRIX - Fatal error!' );
  end

  a = zeros ( n, n );

  for i = 1 : 2 : n - 1

    a(i,i)                  =   c(1);
    a(i,i+1)                =   c(2);
    a(i,i4_wrap(i+2,1,n))   =   c(3);
    a(i,i4_wrap(i+3,1,n))   =   c(4);
    a(i,i4_wrap(i+4,1,n))   =   c(5);
    a(i,i4_wrap(i+5,1,n))   =   c(6);

    a(i+1,i)                =   c(6);
    a(i+1,i+1)              = - c(5);
    a(i+1,i4_wrap(i+2,1,n)) =   c(4);
    a(i+1,i4_wrap(i+3,1,n)) = - c(3);
    a(i+1,i4_wrap(i+4,1,n)) =   c(2);
    a(i+1,i4_wrap(i+5,1,n)) = - c(1);

  end

  return
end
