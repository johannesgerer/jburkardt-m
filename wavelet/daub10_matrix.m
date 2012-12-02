function a = daub10_matrix ( n )

%*****************************************************************************80
%
%% DAUB10_MATRIX returns the DAUB10 matrix.
%
%  Discussion:
%
%    The DAUB10 matrix is the Daubechies wavelet transformation matrix
%    with 10 coefficients.
%
%    Note that in the reference, the coefficient 0.0775714938400459
%    is given incorrectly, with the "8" misrepresented as a "0".
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
%  Reference:
%
%    Gilbert Strang, Truong Nguyen,
%    Wavelets and Filter Banks,
%    Wellesley-Cambridge Press, 1997,
%    ISBN: 0-9614088-7-1,
%    LC: TK7872.F5S79 / QA403.3.S87
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 10, and a multiple of 2.
%
%    Output, real A(N,N), the matrix.
%
  c = [ ...
    0.1601023979741929; ...
    0.6038292697971895; ...
    0.7243085284377726; ...
    0.1384281459013203; ...
   -0.2422948870663823; ...
   -0.0322448695846381; ...
    0.0775714938400459; ...
   -0.0062414902127983; ...
   -0.0125807519990820; ...
    0.0033357252854738 ];

  if ( n < 10 || mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DAUB10_MATRIX - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 10 and a multiple of 2.\n' );
    error ( 'DAUB10_MATRIX - Fatal error!' );
  end

  a = zeros ( n, n );

  for i = 1 : 2 : n - 1

    a(i,i)                  =    c(1);
    a(i,i+1)                =    c(2);
    a(i,i4_wrap(i+2,1,n))   =    c(3);
    a(i,i4_wrap(i+3,1,n))   =    c(4);
    a(i,i4_wrap(i+4,1,n))   =    c(5);
    a(i,i4_wrap(i+5,1,n))   =    c(6);
    a(i,i4_wrap(i+6,1,n))   =    c(7);
    a(i,i4_wrap(i+7,1,n))   =    c(8);
    a(i,i4_wrap(i+8,1,n))   =    c(9);
    a(i,i4_wrap(i+9,1,n))   =   c(10);

    a(i+1,i)                =   c(10);
    a(i+1,i+1)              =  - c(9);
    a(i+1,i4_wrap(i+2,1,n)) =    c(8);
    a(i+1,i4_wrap(i+3,1,n)) =  - c(7);
    a(i+1,i4_wrap(i+4,1,n)) =    c(6);
    a(i+1,i4_wrap(i+5,1,n)) =  - c(5);
    a(i+1,i4_wrap(i+6,1,n)) =    c(4);
    a(i+1,i4_wrap(i+7,1,n)) =  - c(3);
    a(i+1,i4_wrap(i+8,1,n)) =    c(2);
    a(i+1,i4_wrap(i+9,1,n)) =  - c(1);

  end

  return
end
