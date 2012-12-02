function a = loewner ( w, x, y, z, n )

%*****************************************************************************80
%
%% LOEWNER returns the Loewner matrix.
%
%  Formula:
%
%    A(I,J) = ( W(I) - X(J) ) / ( Y(I) - Z(J) )
%
%  Example:
%
%    N = 3
%    W = (/ 8, 4, 9 /)
%    X = (/ 1, 2, 3 /)
%    Y = (/ 9, 6, 4 /)
%    Z = (/ 2, 3, 1 /)
%
%    A =
%
%    8 - 1  8 - 2  8 - 3
%    -----  -----  -----
%    9 - 2  9 - 3  9 - 1
%
%    4 - 1  4 - 2  4 - 3
%    -----  -----  -----
%    6 - 2  6 - 3  6 - 1
%
%    9 - 1  9 - 2  9 - 3
%    -----  -----  -----
%    4 - 2  4 - 3  4 - 1
%
%    =
%
%    7/7  6/6  5/8
%
%    3/4  2/3  1/5
%
%    8/2  7/1  6/3
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real W(N), X(N), Y(N), Z(N), vectors defining 
%    the matrix.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( y(i) - z(j) == 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'LOEWNER - Fatal error!\n' );
        fprintf ( 1, '  Y(I) = Z(J).\n' );
        error ( 'LOEWNER - Fatal error!' );
      end

      a(i,j) = ( w(i) - x(j) ) / ( y(i) - z(j) );

    end
  end

  return
end
