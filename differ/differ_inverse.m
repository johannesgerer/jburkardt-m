function a = differ_inverse ( n, stencil )

%*****************************************************************************80
%
%% DIFFER_INVERSE returns the inverse of the DIFFER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix desired.
%
%    Input, real STENCIL(N), the values that define A.
%    The entries of STENCIL must be distinct.
%    No entry of STENCIL may be zero.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( j == 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  for i = 1 : n

    indx = 0;

    for k = 1 : n

      if ( k ~= i )

        indx = indx + 1;

        for j = indx + 1: - 1 : 1

          a(i,j) = - stencil(k) * a(i,j) / ( stencil(i) - stencil(k) );

          if ( 1 < j )
            a(i,j) = a(i,j) + a(i,j-1) / ( stencil(i) - stencil(k) );
          end

        end

      end

    end

  end

  for i = 1 : n
    a(i,1:n) = a(i,1:n) / stencil(i);
  end

  return
end
