function a = fibonacci2_inverse ( n )

%*****************************************************************************80
%
%% FIBONACCI2_INVERSE returns the inverse of the FIBONACCI2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
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
  a = zeros ( n, n );

  if ( n == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FIBONACCI2_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The inverse does not exist for N = 1.\n' );
    error ( 'FIBONACCI2_INVERSE - Fatal error!' )
  end
%
%  Column 1.
%
  j = 1;
  s = -1.0;
  for i = 1 : n
    a(i,j) = s;
    s = -s;
  end
%
%  Column 2
%
  j = 2;
  a(1,j) = 1.0;
  a(2:n,j) = 0.0;
%
%  Columns 3:N
%
  for j = 3 : n
    a(1:j-1,j) = 0.0;
    s = 1.0;
    for i = j : n
      a(i,j) = s;
      s = -s;
    end
  end

  return
end
