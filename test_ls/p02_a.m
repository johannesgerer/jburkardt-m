function a = p02_a ( m, n )

%*****************************************************************************80
%
%% P02_A returns the matrix A for problem 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Cleve Moler,
%    Numerical Computing with MATLAB,
%    SIAM, 2004,
%    ISBN13: 978-0-898716-60-3,
%    LC: QA297.M625,
%    ebook: http://www.mathworks.com/moler/chapters.html
%
%  Parameters:
%
%    Input, integer M, the number of equations.
%
%    Input, integer N, the number of variables.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    a(i,n) = 1.0;
    for j = n - 1 : -1 : 1
      a(i,j) = a(i,j+1) * ( i - 1 ) / 5.0;
    end
  end

  return
end
