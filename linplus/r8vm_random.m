function [ a, seed ] = r8vm_random ( m, n, seed )

%*****************************************************************************80
%
%% R8VM_RANDOM randomizes a R8VM matrix.
%
%  Discussion:
%
%    The R8VM storage format is used for an M by N Vandermonde matrix.
%    An M by N Vandermonde matrix is defined by the values in its second
%    row, which will be written here as X(1:N).  The matrix has a first 
%    row of 1's, a second row equal to X(1:N), a third row whose entries
%    are the squares of the X values, up to the M-th row whose entries
%    are the (M-1)th powers of the X values.  The matrix can be stored
%    compactly by listing just the values X(1:N).
%
%    The parameter M is not actually needed by this routine.
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
%    Output, real A(N), the R8VM matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ a, seed ] = r8vec_uniform_01 ( n, seed );

  return
end
