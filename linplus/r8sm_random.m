function [ a, u, v, seed ] = r8sm_random ( m, n, seed )

%*****************************************************************************80
%
%% R8SM_RANDOM randomizes a R8SM matrix.
%
%  Discussion:
%
%    The R8SM storage format is used for an M by N Sherman Morrison matrix B,
%    which is defined by an M by N matrix A, an M vector U, and
%    an N vector V, by B = A - U * V'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(M,N), the R8SM matrix.
%
%    Output, real U(M), V(N), the R8SM vectors.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  for j = 1 : n
    for i = 1 : m
      [ a(i,j), seed ] = r8_uniform_01 ( seed );
    end
  end

  for i = 1 : m
    [ u(i), seed ] = r8_uniform_01 ( seed );
  end

  for j = 1 : n
    [ v(j), seed ] = r8_uniform_01 ( seed );
  end

  return
end
