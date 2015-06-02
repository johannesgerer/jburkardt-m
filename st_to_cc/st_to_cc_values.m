function acc = st_to_cc_values ( nst, ist, jst, ast, ncc, n, icc, ccc )

%*****************************************************************************80
%
%% ST_TO_CC_VALUES creates CC values from ST data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NST, the number of ST elements.
%
%    Input, integer IST(NST), JST(NST), the ST rows and columns.
%
%    Input, real AST(NST), the ST values.
%
%    Input, integer NCC, the number of CC elements.
%
%    Input, integer N, the number of columns.
%
%    Input, integer ICC(NCC), the CC rows.
%
%    Input, integer CCC(N+1), the CC compressed columns.
%
%    Output, real ACC(NCC), the CC values.
%
  acc = zeros ( ncc, 1 );

  for kst = 1 : nst

    i = ist(kst);
    j = jst(kst);

    clo = ccc(j);
    chi = ccc(j+1);

    fail = 1;

    for kcc = clo : chi - 1
      if ( icc(kcc) == i )
        acc(kcc) = acc(kcc) + ast(kst);
        fail = 0;
        break
      end                 
    end

    if ( fail )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ST_TO_CC_VALUES - Fatal error!\n' );
      fprintf ( 1, '  ST entry cannot be located in CC array.\n' );
      fprintf ( 1, '  ST index KST    = %d\n', kst );
      fprintf ( 1, '  ST row IST(KST) = %d\n', ist(kst) );
      fprintf ( 1, '  ST col JST(KST) = %d\n', jst(kst) );
      fprintf ( 1, '  ST val AST(KST) = %g\n', ast(kst) );
      error ( 'ST_TO_CC_VALUES - Fatal error!' );
    end

  end

  return
end
