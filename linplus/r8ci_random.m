function [ a, seed ] = r8ci_random ( n, seed )

%*****************************************************************************80
%
%% R8CI_RANDOM randomizes a R8CI matrix.
%
%  Discussion:
%
%    The R8CI storage format is used for an N by N circulant matrix.
%    An N by N circulant matrix A has the property that the entries on
%    row I appear again on row I+1, shifted one position to the right,
%    with the final entry of row I appearing as the first of row I+1.
%    The R8CI format simply records the first row of the matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(N), the R8CI matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  for i = 1 : n
    [ a(i), seed ] = r8_uniform_01 ( seed );
  end

  return
end
