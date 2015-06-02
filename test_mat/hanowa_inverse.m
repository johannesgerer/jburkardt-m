function a = hanowa_inverse ( alpha, n )

%*****************************************************************************80
%
%% HANOWA_INVERSE returns the inverse of the HANOWA matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar defining the Hanowa matrix.  A
%    typical value is -1.0.
%
%    Input, integer N, the order of A.  N must be even.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  n2 = floor ( n / 2 );

  for i = 1 : n2

    a(i,   i)    =   alpha / ( alpha * alpha + i * i );
    a(i+n2,i)    = -   i   / ( alpha * alpha + i * i );

    a(i+n2,i+n2) =   alpha / ( alpha * alpha + i * i );
    a(i,   i+n2) = +   i   / ( alpha * alpha + i * i );
 
  end

  return
end
