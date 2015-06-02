function x = r8mat_fs ( n, a, b )

%*****************************************************************************80
%
%% R8MAT_FS factors and solves a system with one right hand side.
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
%    21 January 2013
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
%    Input, real A(N,N), the coefficient matrix of the linear system.
%
%    Input, real B(N,1), the right hand side of the linear system.
%
%    Output, real X(N,1), the solution of the linear system.
%
  info = 0;
  x(1:n,1) = b(1:n,1);

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
      fprintf ( 1, 'R8MAT_FS - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      return
    end
%
%  Switch rows JCOL and IPIV, and B.
%
    if ( jcol ~= ipiv )

      s(1,1:n)    = a(jcol,1:n);
      a(jcol,1:n) = a(ipiv,1:n);
      a(ipiv,1:n) = s(1,1:n);

      t         = x(jcol,1);
      x(jcol,1) = x(ipiv,1);
      x(ipiv,1) = t;

    end
%
%  Scale the pivot row.
%
    temp = a(jcol,jcol);
    a(jcol,jcol) = 1.0;
    a(jcol,jcol+1:n) = a(jcol,jcol+1:n) / temp;
    x(jcol,1) = x(jcol,1) / temp;
%
%  Use the pivot row to eliminate lower entries in that column.
%
    for i = jcol+1 : n
      if ( a(i,jcol) ~= 0.0 )
        temp = - a(i,jcol);
        a(i,jcol) = 0.0;
        a(i,jcol+1:n) = a(i,jcol+1:n) + temp * a(jcol,jcol+1:n);
        x(i,1) = x(i,1) + temp * x(jcol,1);
      end
    end

  end
%
%  Back solve.
%
  for jcol = n : -1 : 2
    x(1:jcol-1,1) = x(1:jcol-1,1) - a(1:jcol-1,jcol) * x(jcol,1);
  end

  return
end
