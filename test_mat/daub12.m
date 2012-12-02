function a = daub12 ( n )

%*****************************************************************************80
%
%% DAUB12 returns the DAUB12 matrix.
%
%  Discussion:
%
%    The DAUB12 matrix is the Daubechies wavelet transformation matrix
%    with 12 coefficients.
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
%    N must be at least 12, and a multiple of 2.
%
%    Output, real A(N,N), the matrix.
%
  c = [ ...
    0.1115407433501095, ...
    0.4946238903984533, ...
    0.7511339080210959, ...
    0.3152503517091982, ...
   -0.2262646939654400, ...
   -0.1297668675672625, ...
    0.0975016055873225, ...
    0.0275228655303053, ...
   -0.0315820393174862, ...
    0.0005538422011614, ...
    0.0047772575109455, ...
   -0.0010773010853085 ]';

  if ( n < 12 || mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DAUB12 - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 12 and a multiple of 2.\n' );
    error ( 'DAUB12 - Fatal error!' );
  end

  a = zeros ( n, n );

  for i = 1 : 2 : n - 1

    a(i,i)                   =    c(1);
    a(i,i+1)                 =    c(2);
    a(i,i4_wrap(i+ 2,1,n))   =    c(3);
    a(i,i4_wrap(i+ 3,1,n))   =    c(4);
    a(i,i4_wrap(i+ 4,1,n))   =    c(5);
    a(i,i4_wrap(i+ 5,1,n))   =    c(6);
    a(i,i4_wrap(i+ 6,1,n))   =    c(7);
    a(i,i4_wrap(i+ 7,1,n))   =    c(8);
    a(i,i4_wrap(i+ 8,1,n))   =    c(9);
    a(i,i4_wrap(i+ 9,1,n))   =   c(10);
    a(i,i4_wrap(i+10,1,n))   =   c(11);
    a(i,i4_wrap(i+11,1,n))   =   c(12);

    a(i+1,i)                 =   c(12);
    a(i+1,i+1)               = - c(11);
    a(i+1,i4_wrap(i+ 2,1,n)) =   c(10);
    a(i+1,i4_wrap(i+ 3,1,n)) =  - c(9);
    a(i+1,i4_wrap(i+ 4,1,n)) =    c(8);
    a(i+1,i4_wrap(i+ 5,1,n)) =  - c(7);
    a(i+1,i4_wrap(i+ 6,1,n)) =    c(6);
    a(i+1,i4_wrap(i+ 7,1,n)) =  - c(5);
    a(i+1,i4_wrap(i+ 8,1,n)) =    c(4);
    a(i+1,i4_wrap(i+ 9,1,n)) =  - c(3);
    a(i+1,i4_wrap(i+10,1,n)) =    c(2);
    a(i+1,i4_wrap(i+11,1,n)) =  - c(1);

  end

  return
end
