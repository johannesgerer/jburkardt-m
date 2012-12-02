function linplus_test26 ( )

%*****************************************************************************80
%
%% TEST26 tests R8GB_NZ_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  m = 10;
  n = m;
  ml = 1;
  mu = 2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST26\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  R8GB_COUNT_NONZEROS counts the nonzero entries.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =              %d\n', m );
  fprintf ( 1, '  Matrix columns N =           %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML         = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU         = %d\n', mu );
%
%  Set the matrix.
%
  [ a, seed ] = r8gb_random ( m, n, ml, mu, seed );
%
%  Make some zero entries.
%
  for j = 1 : n
    for diag = 1 : 2*ml+mu+1
      if ( a(diag,j) < 0.3E+00 )
        a(diag,j) = 0.0E+00;
      end
    end
  end

  r8gb_print ( m, n, ml, mu, a, '  The R8GB matrix:' );

  nz_num = r8gb_nz_num ( m, n, ml, mu, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Nonzero entries = %d\n', nz_num );

  return
end
