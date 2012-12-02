function am = r8vec_stutter ( n, a, m )

%*****************************************************************************80
%
%% R8VEC_STUTTER makes a "stuttering" copy of an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    Applying a stuttering factor M of 3, the vector A = ( 1, 5, 8 ) becomes
%    AM = ( 1, 1, 1, 5, 5, 5, 8, 8, 8 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the input vector.
%
%    Input, real A(N), the vector.
%
%    Input, integer M, the "stuttering factor".
%
%    Output, real AM(M*N), the stuttering vector.
%
  am = zeros ( m * n, 1 );

  for i = 1 : n
    jlo = m * ( i - 1 ) + 1;
    jhi = m *   i;
    am(jlo:jhi) = a(i);
  end

  return
end
