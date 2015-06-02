function a = moler3_llt ( n )

%*****************************************************************************80
%
%% MOLER3_LLT returns the Cholesky factor of the MOLER3 matrix.
%
%  Example:
%
%    N = 5
%
%    1  0  0  0  0
%   -1  1  0  0  0
%   -1 -1  1  0  0
%   -1 -1 -1  1  0
%   -1 -1 -1 -1  1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    a(i,1:i-1) = -1.0;
    a(i,i)     =  1.0;
    a(i,i+1:n) =  0.0;
  end

  return
end
