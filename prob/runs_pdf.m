function pdf = runs_pdf ( m, n, r )

%*****************************************************************************80
%
%% RUNS_PDF evaluates the Runs PDF.
%
%  Discussion:
%
%    Suppose we have M symbols of one type and N of another, and we consider
%    the various possible permutations of these symbols.
%
%    Let "R" be the number of runs in a given permutation.  By a "run", we
%    mean a maximal sequence of identical symbols.  Thus, for instance,
%    the permutation
%
%      ABBBAAAAAAAA
%
%    has three runs.
%
%    The probability that a permutation of M+N symbols, with M of one kind
%    and N of another, will have exactly R runs is:
%
%      PDF(M,N)(R) = 2 * C(M-1,R/2-1) * C(N-1,R/2-1)
%                    / C(M+N,N) for R even;
%
%                  = ( C(M-1,(R-1)/2) * C(N-1,(R-3)/2 )
%                    + C(M-1,(R-3)/2) * C(N-1,(R-1)/2 )
%                    ) / C(M+N,N) for R odd.
%
%    Note that the maximum number of runs for a given M and N is:
%
%      M + N,                if M = N
%      2 * min ( M, N ) + 1  otherwise
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Kalimutha Krishnamoorthy,
%    Handbook of Statistical Distributions with Applications,
%    Chapman and Hall, 2006,
%    ISBN: 1-58488-635-8,
%    LC: QA273.6.K75.
%
%  Parameters:
%
%    Input, integer M, N, the parameters of the PDF.
%
%    Input, integer R, the number of runs.
%
%    Output, real PDF, the value of the PDF.
%
  m = round ( m );
  n = round ( n );
  r = round ( r );

  if ( m < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RUN_PDF - Fatal error!\n' );
    fprintf ( 1, '  M must be at least 0.\n' );
    fprintf ( 1, '  The input value of M = %d\n', m );
    error ( 'RUN_PDF - Fatal error!' );
  end

  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RUN_PDF - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 0.\n' );
    fprintf ( 1, '  The input value of N = %d\n', n );
    error ( 'RUN_PDF - Fatal error!' );
  end

  if ( n + m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RUN_PDF - Fatal error!\n' );
    fprintf ( 1, '  M+N must be at least 1.\n' );
    fprintf ( 1, '  The input value of M+N = %d\n', m + n );
    error ( 'RUN_PDF - Fatal error!' );
  end
%
%  If all the symbols are of one type, there is always 1 run.
%
  if ( m == 0 | n == 0 )
    if ( r == 1 )
      pdf = 1.0;
    else
      pdf = 0.0;
    end
    return
  end
%
%  Take care of extreme values of R.
%
  if ( r < 2 | m + n < r )
    pdf = 0.0;
    return
  end
%
%  The normal cases.
%
  if ( mod ( r, 2 ) == 0 )

    pdf = ( 2 * combinatorial ( m - 1, ( r / 2 ) - 1 ) ...
              * combinatorial ( n - 1, ( r / 2 ) - 1 ) ) ...
        / (     combinatorial ( m + n, n ) );

  else

    pdf = (   combinatorial ( m - 1, ( r - 1 ) / 2 ) ...
            * combinatorial ( n - 1, ( r - 3 ) / 2 ) ...
            + combinatorial ( m - 1, ( r - 3 ) / 2 ) ...
            * combinatorial ( n - 1, ( r - 1 ) / 2 ) ) ...
        / (   combinatorial ( m + n, n ) );

  end

  return
end
