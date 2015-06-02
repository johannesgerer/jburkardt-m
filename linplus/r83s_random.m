function [ a, seed ] = r83s_random ( n, seed )

%*****************************************************************************80
%
%% R83S_RANDOM randomizes an R83S matrix.
%
%  Discussion:
%
%    The R83S storage format is used for a tridiagonal scalar matrix.
%    The vector A(3) contains the subdiagonal, diagonal, and superdiagonal
%    values that occur on every row.
%
%  Example:
%
%    Here is how an R83S matrix of order 5, stored as (A1,A2,A3), would
%    be interpreted:
%
%      A2  A3   0   0   0
%      A1  A2  A3   0   0
%       0  A1  A2  A3   0 
%       0   0  A1  A2  A3
%       0   0   0  A1  A2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the linear system.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(3), the R83 matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ a(1:3), seed ] = r8vec_uniform_01 ( 3, seed );
 
  return
end
