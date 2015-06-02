function x = creation_null_left ( m, n )

%*****************************************************************************80
%
%% CREATION_NULL_LEFT returns a left null vector of the CREATION matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Output, real X(M,1), the null vector.
%
  x = zeros ( m, 1 );

  x(1,1) = 1.0;

  return
end
