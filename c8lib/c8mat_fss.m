function b = c8mat_fss ( n, a, nb, b )

%*****************************************************************************80
%
%% C8MAT_FSS factors and solves a system with multiple right hand sides.
%
%  Discussion:
%
%    This routine uses partial pivoting, but no pivot vector is required.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, complex A(N,N), the coefficient matrix of the linear system.
%
%    Input, integer NB, the number of right hand sides.
%
%    Input, complex B(N,NB), the right hand side of the linear system.
%
%    Output, complex B(N,NB), the solution of the linear system.
%
  info = 0;

  for jcol = 1 : n
%
%  Find the maximum element in column I.
%
    piv = abs ( a(jcol,jcol) );
    ipiv = jcol;
    for i = jcol+1 : n
      if ( piv < abs ( a(i,jcol) ) )
        piv = abs ( a(i,jcol) );
        ipiv = i;
      end
    end

    if ( piv == 0.0 )
      info = jcol;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'C8MAT_FSS - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      return
    end
%
%  Switch rows JCOL and IPIV, and B.
%
    if ( jcol ~= ipiv )

      for j = 1 : n
        t         = a(jcol,j);
        a(jcol,j) = a(ipiv,j);
        a(ipiv,j) = t;
      end

      t(1,1:nb)    = b(jcol,1:nb);
      b(jcol,1:nb) = b(ipiv,1:nb);
      b(ipiv,1:nb) = t(1,1:nb);

    end
%
%  Scale the pivot row.
%
    temp = a(jcol,jcol);
    a(jcol,jcol) = 1.0;
    a(jcol,jcol+1:n) = a(jcol,jcol+1:n) / temp;
    b(jcol,1:nb) = b(jcol,1:nb) / temp;
%
%  Use the pivot row to eliminate lower entries in that column.
%
    for i = jcol+1 : n
      if ( a(i,jcol) ~= 0.0 )
        temp = - a(i,jcol);
        a(i,jcol) = 0.0;
        a(i,jcol+1:n) = a(i,jcol+1:n) + temp * a(jcol,jcol+1:n);
        b(i,1:nb) = b(i,1:nb) + temp * b(jcol,1:nb);
      end
    end

  end
%
%  Back solve.
%
  for j = 1 : nb
    for jcol = n : -1 : 2
      b(1:jcol-1,j) = b(1:jcol-1,j) - a(1:jcol-1,jcol) * b(jcol,j);
    end
  end

  return
end
