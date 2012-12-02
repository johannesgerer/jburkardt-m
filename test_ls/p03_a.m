function a = p03_a ( m, n )

%*****************************************************************************80
%
%% P03_A returns the matrix A for problem 3.
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
  a = [  1.0,  2.0,  3.0; ...
         4.0,  5.0,  6.0; ...
         7.0,  8.0,  9.0; ...
        10.0, 11.0, 12.0; ...
        13.0, 14.0, 15.0 ];

  return
end
