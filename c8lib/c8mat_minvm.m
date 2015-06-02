function c = c8mat_minvm ( n1, n2, a, b )

%*****************************************************************************80
%
%% C8MAT_MINVM computes inverse(A) * B for C8MAT's.
%
%  Discussion:
%
%    A C8MAT is an array of C8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, the order of the matrices.
%
%    Input, complex A(N1,N1), B(N1,N2), the matrices.
%
%    Output, complex C(N1,N2), the result, C = inverse(A) * B.
%
  c = a \ b;

  return
end
