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
%    12 January 2011
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
%    Input, string TITLE, a title.
%
  inc = 20;

  if ( 0 < length ( title ) )

    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );

    for ilo = 1 : inc : n
      fprintf ( 1, '\n' );
      ihi = min ( n, ilo + inc - 1 );
      for i = ilo : ihi
        fprintf ( 1, '  %2d', i );
      end
      fprintf ( 1, '\n' );
      for i = ilo : ihi
        fprintf ( 1, '  %2d', p(i) );
      end
      fprintf ( 1, '\n' );
    end

  else

    for ilo = 1 : inc : n
      ihi = min ( n, ilo + inc - 1 );
      for i = ilo : ihi
        fprintf ( 1, '  %2d', p(i) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
