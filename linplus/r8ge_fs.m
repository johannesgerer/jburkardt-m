function x = r8ge_fs ( n, a, b )

%*****************************************************************************80
%
%% R8GE_FS factors and solves a R8GE system.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    R8GE_FS does not save the LU factors of the matrix, and hence cannot
%    be used to efficiently solve multiple linear systems, or even to
%    factor A at one time, and solve a single linear system at a later time.
%
%    R8GE_FS uses partial pivoting, but no pivot vector is required.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2004
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
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution of the linear system.
%
  info = 0;
  x(1:n) = b(1:n);

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

    if ( piv == 0.0E+00 )
      info = jcol;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8GE_FS - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      x = [];
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

      t       = x(jcol);
      x(jcol) = x(ipiv);
      x(ipiv) = t;

    end
%
%  Scale the pivot row.
%
    temp = a(jcol,jcol);
    a(jcol,jcol) = 1.0E+00;
    a(jcol,jcol+1:n) = a(jcol,jcol+1:n) / temp;
    x(jcol) = x(jcol) / temp;
%
%  Use the pivot row to eliminate lower entries in that column.
%
    for i = jcol+1 : n
      if ( a(i,jcol) ~= 0.0E+00 )
        temp = - a(i,jcol);
        a(i,jcol) = 0.0E+00;
        a(i,jcol+1:n) = a(i,jcol+1:n) + temp * a(jcol,jcol+1:n);
        x(i) = x(i) + temp * x(jcol);
      end
    end

  end
%
%  Back solve.
%
  for jcol = n : -1 : 2
    x(1:jcol-1) = x(1:jcol-1) - a(1:jcol-1,jcol)' * x(jcol);
  end

  return
end
