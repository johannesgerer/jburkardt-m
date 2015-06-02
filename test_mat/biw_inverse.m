function b = biw_inverse ( n )

%*****************************************************************************80
%
%% BIW_INVERSE returns the inverse of the BIW matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real B(N,N), the matrix.
%
  b = zeros ( n, n );

  for j = n : -1 : -1
    for i = n : -1 : 1

      aii = 0.5 + i / ( 10 * n );
      aiip1 = -1.0;

      if ( i == j )
        b(i,j) = 1.0 / aii;
      elseif ( i < j )
        b(i,j) = - aiip1 * b(i+1,j) / aii;
      end

    end
  end

  return
end