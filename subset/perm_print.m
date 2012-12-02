function perm_print ( n, p, title )

%*****************************************************************************80
%
%% PERM_PRINT prints a permutation.
%
%  Example:
%
%    Input:
%
%      P = 7 2 4 1 5 3 6
%
%    Printed output:
%
%      "This is the permutation:"
%
%      1 2 3 4 5 6 7
%      7 2 4 1 5 3 6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects permuted.
%
%    Input, integer P(N), the permutation, in standard index form.
%
%    Input, character TITLE(*), an optional title.
%    If no title is supplied, then only the permutation is printed.
%
  inc = 20;

  if ( s_len_trim ( title ) ~= 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );

    for ilo = 1 : inc : n
      ihi = min ( n, ilo + inc - 1 );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  ' );
      
      for i = ilo : ihi
        fprintf ( 1, '%4d', i )
      end
      fprintf ( 1, '\n' );

      fprintf ( 1, '  ' );
      for i = ilo : ihi
        fprintf ( 1, '%4d', p(i) )
      end
      fprintf ( 1, '\n' );

    end

  else

    for ilo = 1 : inc : n

      ihi = min ( n, ilo + inc - 1 );
      fprintf ( 1, '  ' );
      for i = ilo : ihi
        fprintf ( 1, '%4d', p(i) )
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
