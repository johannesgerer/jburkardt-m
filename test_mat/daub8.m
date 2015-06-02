function a = daub8 ( n )

%*****************************************************************************80
%
%% DAUB8 returns the DAUB8 matrix.
%
%  Discussion:
%
%    The DAUB8 matrix is the Daubechies wavelet transformation matrix
%    with 8 coefficients.
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
%    N must be at least 8, and a multiple of 2.
%
%    Output, real A(N,N), the matrix.
%
  if ( n < 8 || mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DAUB8 - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 6 and a multiple of 2.\n' );
    error ( 'DAUB8 - Fatal error!' );
  end

  a = zeros ( n, n );

  c = [ ...
    0.2303778133088964, ... 
    0.7148465705529154, ...
    0.6308807679298587, ...
   -0.0279837694168599, ...
   -0.1870348117190931, ...
    0.0308413818355607, ...
    0.0328830116668852, ...
   -0.0105974017850690 ]';

  for i = 1 : 2 : n - 1

    a(i,i)                  =   c(1);
    a(i,i+1)                =   c(2);
    a(i,i4_wrap(i+2,1,n))   =   c(3);
    a(i,i4_wrap(i+3,1,n))   =   c(4);
    a(i,i4_wrap(i+4,1,n))   =   c(5);
    a(i,i4_wrap(i+5,1,n))   =   c(6);
    a(i,i4_wrap(i+6,1,n))   =   c(7);
    a(i,i4_wrap(i+7,1,n))   =   c(8);

    a(i+1,i)                =   c(8);
    a(i+1,i+1)              = - c(7);
    a(i+1,i4_wrap(i+2,1,n)) =   c(6);
    a(i+1,i4_wrap(i+3,1,n)) = - c(5);
    a(i+1,i4_wrap(i+4,1,n)) =   c(4);
    a(i+1,i4_wrap(i+5,1,n)) = - c(3);
    a(i+1,i4_wrap(i+6,1,n)) =   c(2);
    a(i+1,i4_wrap(i+7,1,n)) = - c(1);

  end

  return
end
