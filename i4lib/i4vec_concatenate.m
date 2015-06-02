function c = i4vec_concatenate ( n1, a, n2, b )

%*****************************************************************************80
%
%% I4VEC_CONCATENATE concatenates two I4VEC's.
%
%  Discussion:
%
%    An I4VEC is a vector of I4 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, the number of entries in the first vector.
%
%    Input, integer A(N1), the first vector.
%
%    Input, integer N2, the number of entries in the second vector.
%
%    Input, integer B(N2), the second vector.
%
%    Output, integer C(N1+N2), the concatenation of A and B.
%
  c(   1:n1)    = a(1:n1);
  c(n1+1:n1+n2) = b(1:n2);

  return
end
