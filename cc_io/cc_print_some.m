function cc_print_some ( i_min, i_max, j_min, j_max, ncc, n, icc, ccc, acc, ...
  title )

%*****************************************************************************80
%
%% CC_PRINT_SOME prints some of a sparse matrix in CC format.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I_MIN, IMAX, the first and last rows to print.
%
%    Input, integer J_MIN, J_MAX, the first and last columns 
%    to print.
%
%    Input, integer NCC, the number of CC elements.
%
%    Input, integer N, the number of columns.
%
%    Input, integer ICC(NCC), the CC rows.
%
%    Input, integer CCC(N+1), the compressed CC columns.
%
%    Input, real ACC(NCC), the CC values.
%
%    Input, string TITLE, a title.
%
  if ( ccc(1) == 0 )

    j = 0;
    for k = 1 : ncc
      i = icc(k);
      while ( ccc(j+2) <= k - 1 )
        j = j + 1;
      end
      if ( i_min <= i && i <= i_max && ...
           j_min <= j && j <= j_max )
        fprintf ( 1, '  %4d  %4d  %4d  %16.8g\n', k - 1, i, j, acc(k) );
      end
    end

  else

    j = 1;
    for k = 1 : ncc
      i = icc(k);
      while ( ccc(j+1) <= k )
        j = j + 1;
      end
      if ( i_min <= i && i <= i_max && ...
           j_min <= j && j <= j_max )
        fprintf ( 1, '  %4d  %4d  %4d  %16.8g\n', k, i, j, acc(k) );
     end
    end

  end

  return
end
