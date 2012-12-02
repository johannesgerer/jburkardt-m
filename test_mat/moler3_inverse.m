function a = moler3_inverse ( n )

%*****************************************************************************80
%
%% MOLER3_INVERSE returns the inverse of the MOLER3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
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
  l(1:n,1:n) = 0.0;

  for j = 1 : n
    l(j,j) = 1.0;
    value = 1.0;
    for i = j + 1 : n
      l(i,j) = value;
      value = value * 2.0;
    end
  end

  a(1:n,1:n) = l(1:n,1:n)' * l(1:n,1:n);

  return
end
