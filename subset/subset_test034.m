function subset_test034 ( )

%*****************************************************************************80
%
%% TEST034 tests I4_SQRT_CF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  max_term = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST034\n' );
  fprintf ( 1, '  I4_SQRT_CF computes the continued fraction form\n' );
  fprintf ( 1, '  of the square root of an integer.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N  Period  Whole  Repeating Part\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 20

    [ b, n_term ] = i4_sqrt_cf ( n, max_term );
    fprintf ( 1, '  %3d  %6d  %5d', n, n_term, b(1) );
    for i = 2 : n_term+1

      fprintf ( 1, '  %3d', b(i) );
      
      if ( mod ( i, 10 ) == 0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, '               ' );
      end
      
    end
    fprintf ( 1, '\n' );

  end

  return
end
