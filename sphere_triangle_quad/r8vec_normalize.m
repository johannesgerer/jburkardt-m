function a = r8vec_normalize ( n, a )

%*****************************************************************************80
%
%% R8VEC_NORMALIZE normalizes an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A(N), the vector to be normalized.
%
%    Output, real A(N), the vector should have unit Euclidean norm.
%
  t = r8vec_norm ( n, a );

  if ( t == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_NORMALIZE - Fatal error!\n' );
    fprintf ( 1, '  The vector has norm 0.\n' );
    error ( 'R8VEC_NORMALIZE - Fatal error!' );
  end

  a(1:n) = a(1:n) / t;

  return
end

