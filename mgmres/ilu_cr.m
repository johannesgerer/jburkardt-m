function l = ilu_cr ( n, nz_num, ia, ja, a, ua )

%*****************************************************************************80
%
%% ILU_CR computes the incomplete LU factorization of a matrix.
%
%  Discussion:
%
%    The matrix A is assumed to be stored in compressed row format.  Only
%    the nonzero entries of A are stored.  The vector JA stores the
%    column index of the nonzero value.  The nonzero values are sorted
%    by row, and the compressed row vector IA then has the property that
%    the entries in A and JA that correspond to row I occur in indices
%    IA(I) through IA(I+1)-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%   
%  Modified:
%
%    25 March 2008
%
%  Author:
%
%    Original C version by Lili Ju.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the order of the system.
%
%    Input, integer NZ_NUM, the number of nonzeros.
%
%    Input, integer IA(N+1), JA(NZ_NUM), the row and column indices
%    of the matrix values.  The row vector has been compressed.
%
%    Input, real A(NZ_NUM), the matrix values.
%
%    Input, integer UA(N), the index of the diagonal element of each row.
%
%    Output, real L(NZ_NUM), the ILU factorization of A.
%

%
%  Copy A.
%
  l(1:nz_num) = a(1:nz_num);

  for i = 1 : n
%
%  IW points to the nonzero entries in row I.
%
    iw(1:n) = -1;

    for k = ia(i) : ia(i+1) - 1
      iw(ja(k)) = k;
    end

    for j = ia(i) : ia(i+1) - 1
      jrow = ja(j);
      if ( i <= jrow )
        break;
      end
      tl = l(j) * l(ua(jrow));
      l(j) = tl;
      for jj = ua(jrow) + 1 : ia(jrow+1) - 1
        jw = iw(ja(jj));
        if ( jw ~= -1 ) 
          l(jw) = l(jw) - tl * l(jj);
        end
      end
    end

    ua(i) = j;

    if ( jrow ~= i ) 
    {
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ILU_CR - Fatal error!\n' );
      fprintf ( 1, '  JROW ~= I\n' );
      fprintf ( 1, '  JROW = %d\n', jrow );
      fprintf ( 1, '  I    = %d\n', i );
      exit ( 1 );
    }

    if ( l(j) == 0.0 ) 
    {
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ILU_CR - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step I = \n', i );
      fprintf ( 1, '  L(%d) = 0.0\n', j );
      exit ( 1 );
    }

    l(j) = 1.0 / l(j);
  end

  l(ua(1:n)) = 1.0 / l(ua(1:n));

  return
end
