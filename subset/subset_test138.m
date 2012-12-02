function subset_test138 ( )

%*****************************************************************************80
%
%% TEST138 tests R8POLY_PVAL.
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
  n = 4;

  for i = 0 : n
    a(i+1) = i + 1;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST138\n' );
  fprintf ( 1, '  R8POLY_PVAL evaluates a polynomial\n' );
  fprintf ( 1, '  in power sum form.\n' );

  r8poly_print ( n, a, '  The polynomial to be evaluated:' );

  x = 2.0;
 
  val = r8poly_pval ( n, a, x );

  fprintf ( 1, '  At X = %f\n', x );
  fprintf ( 1, '  Computed polynomial value is %f\n', val );
  fprintf ( 1, '  Correct value is 129.\n' );

  return
end
