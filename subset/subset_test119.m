function subset_test119 ( )

%*****************************************************************************80
%
%% TEST119 tests RAT_FAREY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  max_frac = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST119\n' );
  fprintf ( 1, '  RAT_FAREY computes a row of the Farey fraction table.\n' );

  for n = 1 : 7

    [ a, b, num_frac] = rat_farey ( n, max_frac );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row %d\n', n );
    fprintf ( 1, '  Number of fractions: %d\n', num_frac )

    for ilo = 1 : 20 : num_frac
      ihi = min ( ilo+20-1, num_frac );
      fprintf ( 1, '\n' );
      for i = ilo : ihi
        fprintf ( 1, '%3d', a(i) );
      end
      fprintf ( 1, '\n' );
      for i = ilo : ihi
        fprintf ( 1, '%3d', b(i) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
