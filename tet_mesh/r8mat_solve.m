function [ a, info ] = r8mat_solve ( n, nrhs, a )

%*****************************************************************************80
%
%% R8MAT_SOLVE uses Gauss-Jordan elimination to solve an N by N linear system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer NRHS, the number of right hand sides.  NRHS
%    must be at least 0.
%
%    Input, real A(N,N+NRHS), contains in rows and
%    columns 1 to N the coefficient matrix, and in columns N+1 through
%    N+NRHS, the right hand sides.
%
%    Output, real A(N,N+NRHS), the coefficient matrix
%    area has been destroyed, while the right hand sides have
%    been overwritten with the corresponding solutions.
%
%    Output, integer INFO, singularity flag.
%    0, the matrix was not singular, the solutions were computed;
%    J, factorization failed on step J, and the solutions could not
%    be computed.
%
  info = 0;

  for j = 1 : n
%
%  Choose a pivot row IPIVOT.
%
    ipivot = j;
    apivot = a(j,j);

    for i = j+1 : n
      if ( abs ( apivot ) < abs ( a(i,j) ) )
        apivot = a(i,j);
        ipivot = i;
      end
    end

    if ( apivot == 0.0 )
      info = j;
      return;
    end
%
%  Interchange.
%
    temp               = a(ipivot,1:n+nrhs);
    a(ipivot,1:n+nrhs) = a(j,     1:n+nrhs);
    a(j,     1:n+nrhs) = temp;
%
%  A(J,J) becomes 1.
%
    a(j,j) = 1.0;
    a(j,j+1:n+nrhs) = a(j,j+1:n+nrhs) / apivot;
%
%  A(I,J) becomes 0.
%
    for i = 1 : n

      if ( i ~= j )

        factor = a(i,j);
        a(i,j) = 0.0;
        a(i,j+1:n+nrhs) = a(i,j+1:n+nrhs) - factor * a(j,j+1:n+nrhs);

      end

    end

  end

  return
end

